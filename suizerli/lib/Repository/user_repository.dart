import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// TODO make use of Google Login!

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  String userEmail;

  UserRepository({FirebaseAuth firebaseAuth, GoogleSignIn googleSignIn})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    await _firebaseAuth.signInWithCredential(credential);

    return _firebaseAuth.currentUser();
  }

  Future<bool> checkEmailAlreadyExisting(String email) async {
    List<String> emailResult =
        await _firebaseAuth.fetchSignInMethodsForEmail(email: email);

    return emailResult.isNotEmpty;
  }

  Future<void> signInWithCredentials(String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: userEmail, password: password);
  }

  Future<void> signUp({String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: userEmail, password: password);
  }

  Future<void> signOut() async {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }

  Future<String> getCurrentUser() async {
    return (await _firebaseAuth.currentUser()).email;
  }
}
