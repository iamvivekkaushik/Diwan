import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Dependencies
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  // Shared State for Widgets
//  Observable<FirebaseUser> user; // firebase user
//  Observable<Map<String, dynamic>> profile; // custom user data in Firestore
//  PublishSubject loading = PublishSubject();

  Future<FirebaseUser> loginWithEmailAndPassword(
      String email, String password) async {
    AuthResult authResult = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    updateUserData();

    return authResult.user;
  }

  Future<FirebaseUser> googleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;

    updateUserData();
    return user;
  }

  void updateUserData({String name, String photoURL, bool isAdmin, String country}) async {
    FirebaseUser user = await _auth.currentUser();
    DocumentReference ref = _db.collection('users').document(user.uid);

    ref.get().then((docSnapshot) {
      if(docSnapshot.exists) {
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

        data['lastSeen'] = DateTime.now();
        ref.setData(data, merge: true);
      } else {
        // Document does not exist
        ref.setData({
          'uid': user.uid,
          'email': user.email,
          'photoUrl': user.photoUrl,
          'isAdmin': false,
          'displayName': user.displayName,
          'lastSeen': DateTime.now()
        }, merge: true);
      }
    });
  }

  Future<void> updatePassword(String password) async {
    FirebaseUser user = await _auth.currentUser();

    user.updatePassword(password);
  }

  Future<void> updateProfile({String name, String photoUrl}) async {
    FirebaseUser user = await _auth.currentUser();

    UserUpdateInfo userInfo = UserUpdateInfo();
    name != null ? userInfo.displayName = name : userInfo.displayName = user.displayName;
    photoUrl != null ? userInfo.photoUrl = photoUrl : userInfo.photoUrl = user.photoUrl;

    user.updateProfile(userInfo);
  }

  void signOut() {
    _auth.signOut();
  }
}

final AuthService authService = AuthService();