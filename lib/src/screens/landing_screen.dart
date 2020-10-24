import 'package:flutter/material.dart';
import 'package:flutter_time_tracker_app/services/authFirebase_service.dart';
import 'package:flutter_time_tracker_app/src/screens/home_screen.dart';

import 'signIn_screen.dart';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  AuthUser _authUser;
  AuthFirebaseService _authFirebaseService = AuthFirebaseService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _authUser = _authFirebaseService.currentUser();
    _updateUser(_authUser);
  }

  void _updateUser(AuthUser user) {
    setState(() {
      _authUser = user;
    });
    // print("User id : ${user.uid}");
  }

  @override
  Widget build(BuildContext context) {
    if (_authUser == null)
      return SignInScreen(
        onSignIn: _updateUser,
      );
    else
      return HomeScreen(
        onSignOut: () => _updateUser(null),
      );
  }
}
