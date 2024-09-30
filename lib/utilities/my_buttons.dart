import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String btnName;
  VoidCallback onPressed;
  MyButtons({super.key, required this.btnName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        color: Colors.yellow[300],
        child: Text(btnName),
    );
  }
}
