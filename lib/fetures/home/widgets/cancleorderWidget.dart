import 'package:bloc_practice/config/colorConst.dart';
import 'package:bloc_practice/config/styling.dart';

import 'package:flutter/material.dart';

class Cancleorderwidget extends StatelessWidget {
  const Cancleorderwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: [pinkColor, semipinkColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ListTile(
        leading: Image.asset("assets/canceled.png"),
        title: Text.rich(
          TextSpan(
            text: "10 ",
            style: style(14, FontWeight.w700, redColor),
            children: [
              TextSpan(
                text: "Deliveries Canceled \n",
                style: style(14, FontWeight.w700, blackColor),
              ),

              TextSpan(
                text: "Last 7 Days",
                style: style(10, FontWeight.w400, blackColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
