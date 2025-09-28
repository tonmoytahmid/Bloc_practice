import 'package:bloc_practice/config/colorConst.dart';
import 'package:bloc_practice/config/styling.dart';
import 'package:flutter/material.dart';

class Submitbuttonwidget extends StatelessWidget {
  final void Function()? onTap;
  const Submitbuttonwidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38,
        width: 112,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: whiteColor,

          boxShadow: [
            BoxShadow(
              color: redColor,
              spreadRadius: 0,
              blurRadius: 1.5,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Submit Cash",
            style: style(14, FontWeight.w500, redColor),
          ),
        ),
      ),
    );
  }
}
