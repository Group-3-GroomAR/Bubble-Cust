mport 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final GoogleSignIn googleSignIn=GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  getUser(){
    return this.auth.currentUser();
  }
  Future<Null> signOutWithGoogle() async {
    // Sign out with firebase
    await auth.signOut();
    // Sign out with google
    await googleSignIn.signOut();
  }
  //constructo
  AuthService(){
//  getUser();
  }
// ignore: unused_element
  Future<FirebaseUser> handleSignIn() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user = (await auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }
//  Observable<FirebaseUser> user;
//  Observable <Map<String,dynamic>> profile;
//  PublishSubject loading = PublishSubject();

//  Future<String> signInWithGoogle() async {
//    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//    final GoogleSignInAuthentication googleSignInAuthentication =
//    await googleSignInAccount.authentication;
//
//    final AuthCredential credential = GoogleAuthProvider.getCredential(
//      accessToken: googleSignInAuthentication.accessToken,
//      idToken: googleSignInAuthentication.idToken,
//    );
//
//    final AuthResult authResult = await _auth.signInWithCredential(credential);
//    final FirebaseUser user = authResult.user;
//
//    assert(!user.isAnonymous);
//    assert(await user.getIdToken() != null);
//
//    final FirebaseUser currentUser = await _auth.currentUser();
//    assert(user.uid == currentUser.uid);
//
//    return 'signInWithGoogle succeeded: $user';
//  }

}
//final AuthService authService = AuthService();