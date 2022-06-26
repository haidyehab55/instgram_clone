import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Back extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.zero,
      icon: Icon(
      Icons.back_hand,
        // width: 30,
        // height: 30,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}