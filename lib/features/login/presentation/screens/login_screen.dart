import 'package:bloc_practice/features/login/presentation/bloc/login_bloc.dart';
import 'package:bloc_practice/features/navigation/screens/navigationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phonecontroller = "";
  final occupationcontroller = TextEditingController();
  final namecontroller = TextEditingController();

  PhoneNumber number = PhoneNumber(isoCode: 'BD');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Deliveryman Login"), centerTitle: true),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Navigationscreen(user: state.user),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is LoginFailure) {
            print("Login failed: ${state.error}");
            return Center(child: Text("Error: ${state.error}"));
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber value) {
                    phonecontroller = value.phoneNumber ?? "";
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  initialValue: number,
                  formatInput: true,
                  inputDecoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Phone Number",
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: occupationcontroller,
                  decoration: InputDecoration(
                    labelText: "Occupation",
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (phonecontroller.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please enter a valid phone number"),
                        ),
                      );
                      return;
                    }
                    context.read<LoginBloc>().add(
                      loginRequested(
                        name: namecontroller.text,
                        phoneNumber: phonecontroller,
                        occupation: occupationcontroller.text,
                      ),
                    );
                    occupationcontroller.clear();
                  },
                  child: Text("Login / Signup with Google"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
