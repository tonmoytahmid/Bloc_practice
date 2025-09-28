import 'package:bloc_practice/config/colorConst.dart';
import 'package:bloc_practice/config/styling.dart';
import 'package:bloc_practice/features/home/widgets/submitbuttonWidget.dart';
import 'package:flutter/material.dart';

class Cashcalculationwidget extends StatelessWidget {
  const Cashcalculationwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xff0000000d)),
        color: whiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/cash.png"),
          SizedBox(height: 10),
          Text("\$310.00", style: style(20, FontWeight.w700, blackColor)),

          Text(
            "You collected from 20 deliveries.",
            style: style(14, FontWeight.w400, blackColor),
          ),
          SizedBox(height: 20),
          Submitbuttonwidget(),
        ],
      ),
    );
  }
}
