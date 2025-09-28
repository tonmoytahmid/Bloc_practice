import 'package:bloc_practice/config/colorConst.dart';
import 'package:bloc_practice/config/styling.dart';
import 'package:bloc_practice/features/account/screens/accountScreen.dart';
import 'package:bloc_practice/features/chatting/screens/chattingScreen.dart';
import 'package:bloc_practice/features/home/screens/homeScreen.dart';
import 'package:bloc_practice/features/login/database/login_database.dart';
import 'package:bloc_practice/features/navigation/bloc/navBloc.dart';
import 'package:bloc_practice/features/navigation/bloc/navEvent.dart';
import 'package:bloc_practice/features/navigation/bloc/navState.dart';
import 'package:bloc_practice/features/order/screens/orderScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Navigationscreen extends StatefulWidget {
  final User user;
  const Navigationscreen({super.key, required this.user});

  @override
  State<Navigationscreen> createState() => _NavigationscreenState();
}

class _NavigationscreenState extends State<Navigationscreen> {
  late final List<Widget> _pages;

  final List<String> _icons = [
    "assets/home.svg",
    "assets/ordericon.svg",
    "assets/chaticon.svg",
    "assets/accounticon.svg",
  ];

  @override
  void initState() {
    super.initState();
    // Initialize pages here because we can access widget.user in initState
    _pages = [
      Homescreen(),
      Orderscreen(),
      Chattingscreen(),
      Accountscreen(user: widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<Navbloc, Navstate>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.selectedIndex,
            backgroundColor: whiteColor,
            selectedLabelStyle: style(13.0, FontWeight.bold, blackColor),
            unselectedLabelStyle: style(
              13.0,
              FontWeight.normal,
              Color.fromARGB(255, 57, 54, 54),
            ),
            selectedItemColor: blackColor,
            unselectedItemColor: Color.fromARGB(255, 57, 54, 54),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              context.read<Navbloc>().add(NavigateToPage(index));
            },
            items: List.generate(_icons.length, (index) {
              return BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  _icons[index],
                  colorFilter: ColorFilter.mode(
                    state.selectedIndex == index
                        ? redColor
                        : Color.fromARGB(255, 57, 54, 54),
                    BlendMode.srcIn,
                  ),
                ),
                label: ["Home", "Orders", "Chating", "Account"][index],
              );
            }),
          );
        },
      ),
      body: BlocBuilder<Navbloc, Navstate>(
        builder: (context, state) {
          return _pages[state.selectedIndex];
        },
      ),
    );
  }
}
