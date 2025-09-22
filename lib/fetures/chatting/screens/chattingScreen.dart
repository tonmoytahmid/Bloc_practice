import 'package:flutter/material.dart';

class Chattingscreen extends StatefulWidget {
  const Chattingscreen({super.key});

  @override
  State<Chattingscreen> createState() => _ChattingscreenState();
}

class _ChattingscreenState extends State<Chattingscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Chatting Screen")));
  }
}
