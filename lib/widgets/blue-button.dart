// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  //const BlueButton({Key? key}) : super(key: key);

  String text;
  Function() onPressed;

  BlueButton(this.text, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
