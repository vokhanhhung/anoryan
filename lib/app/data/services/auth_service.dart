import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth _firebaseAuth;
  GoogleSignIn _googleSignIn;
  FacebookLogin _facebookLogin;

  AuthService() {
    _firebaseAuth = FirebaseAuth.instance ?? _firebaseAuth;
    _googleSignIn = GoogleSignIn();
    _facebookLogin = FacebookLogin();
  }

  User get user => _firebaseAuth.currentUser;

  Future<Either<String, Unit>> signUp(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> signIn(
    String email,
    String password,
  ) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (error) {
      return left(error.code);
    }
  }

  Future<Either<String, Unit>> signInWithGoogle() async {
    try {
      final googleSignInAccount = await _googleSignIn.signIn();
      final googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _firebaseAuth.signInWithCredential(credential);
      return right(unit);
    } catch (error) {
      return left(error.code);
    }
  }

  Future<Either<String, Unit>> signInWithFacebook() async {
    try {
      FacebookLoginResult facebookLoginResult =
          await _facebookLogin.logIn(['email', 'public_profile']);

      switch (facebookLoginResult.status) {
        case FacebookLoginStatus.cancelledByUser:
          return left('Cancel by user');
          break;
        case FacebookLoginStatus.error:
          return left(facebookLoginResult.errorMessage);
          break;
        case FacebookLoginStatus.loggedIn:
          final accessToken = facebookLoginResult.accessToken.token;
          final facebookAuthCredential =
              FacebookAuthProvider.credential(accessToken);
          await _firebaseAuth.signInWithCredential(facebookAuthCredential);
          break;
      }
      return right(unit);
    } catch (error) {
      print(error.toString());
    }
  }

  Future signOut() async {
    await Future.wait([
      _googleSignIn.signOut(),
      _facebookLogin.logOut(),
      _firebaseAuth.signOut()
    ]);
  }
}
