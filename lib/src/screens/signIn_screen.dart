import 'package:flutter/material.dart';
import 'package:flutter_time_tracker_app/services/authFirebase_service.dart';
import 'package:flutter_time_tracker_app/src/widgets/barM.dart';
import 'package:flutter_time_tracker_app/src/widgets/customRaisedButtonSignIn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snack/snack.dart';

class SignInScreen extends StatelessWidget {
  AuthFirebaseService _auth = AuthFirebaseService();
  void _signInAnonymously(context) async {
    try {
      AuthUser user = await _auth.signInAnonymously();
      print("${user.uid}");
    } catch (e) {
      BarM.barError.show(context);
    }
  }

  void _signInGoogle() async {
    try {
      AuthUser user = await _auth.signInGoogle();
      print("${user.uid}");
    } catch (e) {}
  }

  void _signInFacebook() async {
    try {
      AuthUser user = await _auth.signInFacebook();
      print("${user.uid}");
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('Time Tracker'),
      ),
      body: _buildContainer(),
    );
  }

  Widget _buildContainer() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 60.0,
          ),
          CustomRaisedButtonSignIn(
            title: "Sign in With Google",
            sideIcon: FaIcon(
              FontAwesomeIcons.google,
              size: 30.0,
              color: Color(0xFF34A853),
            ),
            color: Colors.white,
            textColor: Colors.black,
            onPressed: _signInGoogle,
          ),
          SizedBox(
            height: 15.0,
          ),
          CustomRaisedButtonSignIn(
            title: "Sign in With Facebook",
            sideIcon: FaIcon(
              FontAwesomeIcons.facebook,
              color: Colors.white,
              size: 30.0,
            ),
            color: Colors.blue[900],
            onPressed: _signInFacebook,
          ),
          SizedBox(
            height: 15.0,
          ),
          CustomRaisedButtonSignIn(
            title: "Sign in With Apple",
            sideIcon: FaIcon(
              FontAwesomeIcons.apple,
              size: 30.0,
              // color: Colors.white,
            ),
            color: Colors.grey[700],
            onPressed: () => print("Email"),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'or',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.0,
          ),
          Builder(
            builder: (context) {
              return CustomRaisedButtonSignIn(
                title: "Go Anonymous",
                color: Colors.lime[300],
                textColor: Colors.black,
                onPressed: () => _signInAnonymously(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
