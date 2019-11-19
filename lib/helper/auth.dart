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
      await fetchUserData();
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
    firebaseUser = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    await updateUserData();

    return firebaseUser;
  }

  Future<void> signUp(
      {String email, String password, String name, String country}) async {
    firebaseUser = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

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

    firebaseUser = await _auth.signInWithCredential(credential);

    await updateUserData(linkedGoogle: true);
    return firebaseUser;
  }

  Future<FirebaseUser> twitterSignIn() async {
    var twitterLogin = new TwitterLogin(
        consumerKey: twitterKeys['api_key'],
        consumerSecret: twitterKeys['secret_key']);

    final TwitterLoginResult result = await twitterLogin.authorize();

    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        var session = result.session;
        AuthCredential authCredential = TwitterAuthProvider.getCredential(
            authToken: session.token, authTokenSecret: session.secret);

        print(session.token);
        print(session.secret);

        firebaseUser = await _auth.signInWithCredential(authCredential);
        await updateUserData(linkedTwitter: true);

        if(firebaseUser.email == null) {
          signOut();
          throw("Twitter Login Failed: Email Not Found");
        }

        return firebaseUser;
        break;
      case TwitterLoginStatus.cancelledByUser:
        throw (result.errorMessage);
        break;
      case TwitterLoginStatus.error:
        throw (result.errorMessage);
        break;
    }

    return null;
  }

  Future<void> updateUserData(
      {String name,
      String photoURL,
      bool isAdmin,
      String country = "",
      bool linkedGoogle,
      bool linkedTwitter}) async {
    DocumentReference ref = _db.collection('users').document(firebaseUser.uid);

    DocumentSnapshot docSnapshot = await ref.get();

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
      await ref.setData(data, merge: true).catchError((error) {
        print(error);
      });
    } else {
      // Document does not exist
      await ref.setData({
        'uid': firebaseUser.uid,
        'email': firebaseUser.email,
        'photoUrl': firebaseUser.photoUrl,
        'isAdmin': false,
        'country': country,
        'linkedGoogle': linkedGoogle == null ? false : linkedGoogle,
        'linkedTwitter': linkedTwitter == null ? false : linkedTwitter,
        'displayName': name != null ? name : firebaseUser.displayName,
        'lastSeen': DateTime.now()
      }, merge: true).catchError((error) {
        print(error);
      });
    }

    await init();
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

    if (userInfo.displayName == null) {
      userInfo.displayName = "";
    }
    if (userInfo.photoUrl == null) {
      userInfo.photoUrl = "";
    }

    await firebaseUser.updateProfile(userInfo);
  }

  void signOut() {
    _auth.signOut();
  }
}
