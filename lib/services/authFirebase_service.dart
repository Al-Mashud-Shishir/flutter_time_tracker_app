import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/services.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthUser {
  String uid;

  AuthUser.fromFirebase(auth.User user) {
    this.uid = user.uid;
  }
}

class AuthFirebaseService {
  static final _fAuth = auth.FirebaseAuth.instance;
  AuthUser currentUser() {
    final user = _fAuth.currentUser;
    return AuthUser.fromFirebase(user);
  }

  AuthUser _convertUser(auth.User user) {
    if (user == null) return null;
    return AuthUser.fromFirebase(user);
  }

  Stream<AuthUser> get onAuthStateChange {
    return _fAuth.authStateChanges().map(_convertUser);
  }

  Future<AuthUser> signInAnonymously() async {
    try {
      var credentials = await _fAuth.signInAnonymously();
      final user = credentials.user;
      return AuthUser.fromFirebase(user);
    } catch (e) {}
  }

  Future<AuthUser> signInGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication authentication;
    if (googleSignInAccount != null) {
      authentication = await googleSignInAccount.authentication;
      if (authentication.idToken != null &&
          authentication.accessToken != null) {
        final authResult = await _fAuth.signInWithCredential(
            auth.GoogleAuthProvider.credential(
                idToken: authentication.idToken,
                accessToken: authentication.accessToken));
        return AuthUser.fromFirebase(authResult.user);
      } else {
        throw PlatformException(
            code: "ERROR_MISSING_GOOGLE_AUTH_TOKEN",
            message: "Missing Google auth token");
      }
    } else {
      throw PlatformException(
          code: "ERROR_ABORTED_BY_USER", message: "Sign in aborted by user");
    }
  }

  Future<AuthUser> signInFacebook() async {
    final facebookLogin = FacebookLogin();
    final result = await facebookLogin.logIn(['email']);
    var authResult;
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        authResult = await _fAuth.signInWithCredential(
            auth.FacebookAuthProvider.credential(result.accessToken.token));

        break;
      case FacebookLoginStatus.cancelledByUser:
        throw PlatformException(
            code: "ERROR_ABORTED_BY_USER", message: "Sign in aborted by user");
        break;
      case FacebookLoginStatus.error:
        break;
    }
    if (authResult != null) {
      return AuthUser.fromFirebase(authResult.user);
    }
  }

  signOut() async {
    try {
      final googleSignin = GoogleSignIn();
      await googleSignin.disconnect();
    } catch (e) {}
    try {
      final FacebookLogin facebookSignIn = FacebookLogin();
      await facebookSignIn.logOut();
    } catch (e) {}
    await _fAuth.signOut();
  }
}
