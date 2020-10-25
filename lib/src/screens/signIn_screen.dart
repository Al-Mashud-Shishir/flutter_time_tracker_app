import 'package:flutter/material.dart';
import 'package:flutter_time_tracker_app/services/authFirebase_service.dart';
import 'package:flutter_time_tracker_app/src/widgets/barM.dart';
import 'package:flutter_time_tracker_app/src/widgets/customRaisedButtonSignIn.dart';
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
      // color: Colors.white38,
      padding: EdgeInsets.all(16.0),
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
            sideImage: Image.asset("assets/images/google-logo.png"),
            color: Colors.white,
            textColor: Colors.black,
            onPressed: () => print("Google"),
          ),
          SizedBox(
            height: 15.0,
          ),
          CustomRaisedButtonSignIn(
            title: "Sign in With Facebook",
            sideImage: Image.asset("assets/images/facebook-logo.png"),
            color: Colors.blue[900],
            onPressed: () => print("Facebook"),
          ),
          SizedBox(
            height: 15.0,
          ),
          CustomRaisedButtonSignIn(
            title: "Sign in With Email",
            color: Colors.teal[700],
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
