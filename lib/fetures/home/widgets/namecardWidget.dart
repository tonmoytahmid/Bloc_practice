import 'package:bloc_practice/config/colorConst.dart';
import 'package:bloc_practice/config/styling.dart';
import 'package:bloc_practice/fetures/home/widgets/seeorderWidget.dart';
import 'package:flutter/material.dart';

class Namecardwidget extends StatelessWidget {
  const Namecardwidget({super.key});

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
        leading: Image.asset("assets/handicon.png"),
        title: Text.rich(
          TextSpan(
            text: "Hi Tonmoy \n",
            style: headingStyle,
            children: [
              TextSpan(
                text: "You Have 3 Orders to Deliver",
                style: subHeadingStyle,
              ),
            ],
          ),
        ),
        trailing: Seeorderwidget(),
      ),
    );
  }
}
