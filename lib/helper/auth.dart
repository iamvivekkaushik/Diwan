import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diwan/config/config.dart';
import 'package:diwan/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static final AuthService instance = AuthService._();

  // Dependencies
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;
  FirebaseUser firebaseUser;
  User currentUser;

  AuthService._() {
    init();
  }

  Future<void> init() async {
    firebaseUser = await _auth.currentUser();
    if (firebaseUser != null) {
      fetchUserData();
    }
  }

  Future<void> fetchUserData() async {
    if (firebaseUser == null) {
      firebaseUser = await _auth.currentUser();
    }
    DocumentReference ref = _db.collection('users').document(firebaseUser.uid);
    DocumentSnapshot documentSnapshot = await ref.get();

    currentUser = User.fromDocument(documentSnapshot);
  }

  bool isLoggedIn() {
    if (firebaseUser == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<FirebaseUser> loginWithEmailAndPassword(
      String email, String password) async {
    AuthResult authResult = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    firebaseUser = authResult.user;

    updateUserData();

    return firebaseUser;
  }

  Future<void> signUp({String email, String password, String name, String country}) async {
    AuthResult authResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    firebaseUser = authResult.user;
    await updateProfile(name: name);
    updateUserData(name: name, photoURL: "", isAdmin: false, country: country);
    firebaseUser.sendEmailVerification();
  }

  Future<FirebaseUser> googleSignIn() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    firebaseUser = (await _auth.signInWithCredential(credential)).user;

    updateUserData(linkedGoogle: true);
    return firebaseUser;
  }

  Future<FirebaseUser> twitterSignIn() async {
    final TwitterLogin twitterLogin = new TwitterLogin(
        consumerKey: twitterKeys['api_key'],
        consumerSecret: twitterKeys['secret_key']);
    TwitterLoginResult twitterLoginResult = await twitterLogin.authorize();
    TwitterSession currentUserTwitterSession = twitterLoginResult.session;
    TwitterLoginStatus twitterLoginStatus = twitterLoginResult.status;

    if (twitterLoginStatus == TwitterLoginStatus.loggedIn) {
      AuthCredential _authCredential = TwitterAuthProvider.getCredential(
          authToken: currentUserTwitterSession.token.toString(),
          authTokenSecret: currentUserTwitterSession.secret.toString());

      AuthResult authResult = await _auth.signInWithCredential(_authCredential);
      firebaseUser = authResult.user;
      updateUserData(linkedTwitter: true);
      return firebaseUser;
    } else {
      throw (twitterLoginResult.errorMessage);
    }
  }

  void updateUserData(
      {String name,
      String photoURL,
      bool isAdmin,
      String country = "",
      bool linkedGoogle,
      bool linkedTwitter}) async {
    print(linkedGoogle);
    DocumentReference ref = _db.collection('users').document(firebaseUser.uid);

    ref.get().then((docSnapshot) {
      if (docSnapshot.exists) {
        // Document exists only update provided data
        Map<String, dynamic> data = {};

        if (name != null && name.isNotEmpty) {
          data["displayName"] = name;
        }
        if (photoURL != null) {
          data["photoUrl"] = photoURL;
        }
        if (isAdmin != null) {
          data["isAdmin"] = isAdmin;
        }
        if (country != null) {
          data["country"] = country;
        }
        if (linkedGoogle != null) {
          data["linkedGoogle"] = linkedGoogle;
        }
        if (linkedTwitter != null) {
          data["linkedTwitter"] = linkedTwitter;
        }

        data['lastSeen'] = DateTime.now();
        ref.setData(data, merge: true);
      } else {
        // Document does not exist
        ref.setData({
          'uid': firebaseUser.uid,
          'email': firebaseUser.email,
          'photoUrl': firebaseUser.photoUrl,
          'isAdmin': false,
          'country': country,
          'linkedGoogle': linkedGoogle == null ? false : linkedGoogle,
          'linkedTwitter': linkedTwitter == null ? false : linkedTwitter,
          'displayName': firebaseUser.displayName,
          'lastSeen': DateTime.now()
        }, merge: true);
      }

      fetchUserData();
    });
  }

  Future<void> updatePassword(String password) async {
    FirebaseUser user = await _auth.currentUser();

    user.updatePassword(password);
  }

  Future<void> updateProfile({String name, String photoUrl}) async {
    UserUpdateInfo userInfo = UserUpdateInfo();
    name != null
        ? userInfo.displayName = name
        : userInfo.displayName = firebaseUser.displayName;
    photoUrl != null
        ? userInfo.photoUrl = photoUrl
        : userInfo.photoUrl = firebaseUser.photoUrl;

    if(userInfo.displayName == null) {
      userInfo.displayName = "";
    }
    if(userInfo.photoUrl == null) {
      userInfo.photoUrl = "";
    }

    firebaseUser.updateProfile(userInfo);
  }

  void signOut() {
    _auth.signOut();
  }
}
