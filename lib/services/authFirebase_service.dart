import 'package:firebase_auth/firebase_auth.dart' as auth;

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

  signOut() async {
    await _fAuth.signOut();
  }
}
