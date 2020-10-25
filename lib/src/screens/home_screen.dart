import 'package:flutter/material.dart';
import 'package:flutter_time_tracker_app/services/authFirebase_service.dart';

class HomeScreen extends StatelessWidget {
  AuthFirebaseService _authFirebaseService = AuthFirebaseService();
  void _signOut() async {
    try {
      await _authFirebaseService.signOut();
    } catch (e) {
      // print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
        actions: [
          FlatButton.icon(
              onPressed: _signOut,
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              label: Text(
                "Logout",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
