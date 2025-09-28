import 'package:bloc_practice/features/login/database/login_database.dart';
import 'package:bloc_practice/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Accountscreen extends StatelessWidget {
  final User user;
  const Accountscreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<LoginBloc>().add(logoutRequested());
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${user.name}", style: TextStyle(fontSize: 18)),
            Text("Email: ${user.email}", style: TextStyle(fontSize: 18)),
            Text("Phone: ${user.phoneNumber}", style: TextStyle(fontSize: 18)),
            Text(
              "Occupation: ${user.occupation}",
              style: TextStyle(fontSize: 18),
            ),
            // Text("Address: ${user.address}", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
