import 'package:flutter/material.dart';

class CustomRaisedButtonSignIn extends StatelessWidget {
  final String title;
  final Image sideImage;
  final Color color;
  final Function onPressed;

  final Color textColor;

  const CustomRaisedButtonSignIn({
    Key key,
    @required this.title,
    this.sideImage,
    @required this.color,
    @required this.onPressed,
    this.textColor: Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      elevation: 5.0,
      color: this.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: sideImage != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                sideImage,
                buildText(),
                SizedBox(
                  width: 10,
                )
              ],
            )
          : buildText(),
      onPressed: this.onPressed,
    );
  }

  Text buildText() {
    return Text(
      title,
      style: TextStyle(
        color: textColor,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
