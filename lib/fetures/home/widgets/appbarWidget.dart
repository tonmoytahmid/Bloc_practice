import 'package:bloc_practice/config/colorConst.dart';
import 'package:flutter/material.dart';

AppBar appBarWidget(void Function()? onPressed) {
  return AppBar(
    backgroundColor: bgColor,
    // leading: Padding(
    //   padding: EdgeInsets.only(left: 12),
    //   child: Image.asset("assets/foodlay.png"),
    // ),
    title: Image.asset("assets/foodlay.png"),
    actions: [
      IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.notifications, color: blackColor),
      ),
    ],
  );
}
