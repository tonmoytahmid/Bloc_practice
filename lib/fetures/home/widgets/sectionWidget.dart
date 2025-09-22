import 'package:bloc_practice/config/colorConst.dart';
import 'package:bloc_practice/config/styling.dart';
import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  SectionWidget({super.key});

  final List<Map<String, dynamic>> section = [
    {
      'color': blueColor,
      'icon': "assets/timer.png",
      'text': "Ongoing Deliveries",
      'value': "7",
    },
    {
      'color': yellowColor,
      'icon': "assets/ongoing.png",
      'text': "Pending Deliveries",
      'value': "3",
    },
    {
      'color': greenColor,
      'icon': "assets/completed.png",
      'text': "Completed Deliveries",
      'value': "5",
    },
    {
      'color': pinkColor,
      'icon': "assets/canceled.png",
      'text': "Canceled Deliveries",
      'value': "2",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,

        itemCount: section.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Container(
            height: 112.5,
            width: 159,
            decoration: BoxDecoration(
              color: section[index]['color'],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        section[index]['value'],
                        style: style(24, FontWeight.w700, blackColor),
                      ),
                      Image.asset(
                        section[index]['icon'],
                        height: 40,
                        width: 40,
                      ),
                    ],
                  ),

                  Text(section[index]['text'], style: subHeadingStyle),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
