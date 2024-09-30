import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarWidget extends StatefulWidget {
  StarWidget({super.key});

  @override
  State<StarWidget> createState() => _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget> {
  bool isFilled = false;

  void onTapped()
  {
    setState(() {
      isFilled = !isFilled;
    });

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Icon(
        isFilled ? Icons.star : Icons.star_border,
        color: Colors.black,
        size: 28,
      ),
    );
  }
}
