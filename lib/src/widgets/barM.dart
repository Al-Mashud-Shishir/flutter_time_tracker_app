import 'package:flutter/material.dart';

class BarM {
  static final barSuccess = SnackBar(
      content: Text(
    'Signed In Successfully',
    style: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.green[700],
    ),
  ));
  static final barError = SnackBar(
      content: Text(
    'Something Went Wrong, Please Try Again',
    style: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.red[400],
    ),
  ));
}
