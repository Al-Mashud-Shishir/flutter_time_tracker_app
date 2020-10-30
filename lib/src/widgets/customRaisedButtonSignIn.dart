import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomRaisedButtonSignIn extends StatelessWidget {
  final String title;
  final Image sideImage;
  final FaIcon sideIcon;
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
    this.sideIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (sideIcon != null) {
      return RaisedButton.icon(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        elevation: 5.0,
        color: this.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        icon: sideIcon,
        label: buildText(),
        onPressed: this.onPressed,
      );
    } else {
      return RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        elevation: 5.0,
        color: this.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 10,
            ),
            buildText(),
            SizedBox(
              width: 10,
            )
          ],
        ),
        onPressed: this.onPressed,
      );
    }
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
