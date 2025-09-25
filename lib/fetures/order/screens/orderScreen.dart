import 'package:flutter/material.dart';

class Orderscreen extends StatefulWidget {
  final String? orderId;
  const Orderscreen({super.key, this.orderId});

  @override
  State<Orderscreen> createState() => _OrderscreenState();
}

class _OrderscreenState extends State<Orderscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order Screen")),
      body: Center(child: Text("Order Id : " + widget.orderId.toString())),
    );
  }
}
