import 'package:bloc_practice/config/colorConst.dart';
import 'package:bloc_practice/core/helper/notification_helper.dart';
import 'package:bloc_practice/features/home/widgets/appbarWidget.dart';
import 'package:bloc_practice/features/home/widgets/cancleorderWidget.dart';
import 'package:bloc_practice/features/home/widgets/cashcalculationWidget.dart';
import 'package:bloc_practice/features/home/widgets/namecardWidget.dart';
import 'package:bloc_practice/features/home/widgets/sectionWidget.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationHelper().getToken();

    print("Token: ${NotificationHelper().getToken()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: appBarWidget(() {}),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 10,
          bottom: 20,
        ),
        child: ListView(
          children: [
            Namecardwidget(),
            SizedBox(height: 20),
            SectionWidget(),
            SizedBox(height: 20),
            Cancleorderwidget(),
            SizedBox(height: 20),
            Cashcalculationwidget(),
          ],
        ),
      ),
    );
  }
}
