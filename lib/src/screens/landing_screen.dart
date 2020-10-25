import 'package:flutter/material.dart';
import 'package:flutter_time_tracker_app/services/authFirebase_service.dart';
import 'package:flutter_time_tracker_app/src/screens/home_screen.dart';

import 'signIn_screen.dart';

class LandingScreen extends StatelessWidget {
  AuthFirebaseService _authFirebaseService = AuthFirebaseService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthUser>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          AuthUser _authUser = snapshot.data;
          if (_authUser == null)
            return SignInScreen();
          else
            return HomeScreen();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
      stream: _authFirebaseService.onAuthStateChange,
    );
  }
}
