import 'package:bloc_practice/config/colorConst.dart';
import 'package:bloc_practice/config/styling.dart';
import 'package:flutter/material.dart';

class Seeorderwidget extends StatelessWidget {
 final void Function()? onTap;
  const Seeorderwidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 89,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: redColor,
        ),
        child: Center(
          child: Text(
            "See Orders",
            style: style(13, FontWeight.w500, whiteColor),
          ),
        ),
      ),
    );
  }
}
