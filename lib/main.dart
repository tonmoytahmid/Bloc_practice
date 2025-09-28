import 'package:bloc_practice/core/helper/notification_helper.dart';
import 'package:bloc_practice/features/login/data/login_repository.dart';
import 'package:bloc_practice/features/login/database/login_database.dart';
import 'package:bloc_practice/features/login/presentation/bloc/login_bloc.dart';
import 'package:bloc_practice/features/login/presentation/screens/login_screen.dart';
import 'package:bloc_practice/features/navigation/bloc/navBloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> myBackgroundMessageHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  NotificationHelper().showNotification(message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
  NotificationHelper().initialize(GlobalKey<NavigatorState>());

  final db = AppDatabase();
  final loginRepository = LoginRepository(db);

  runApp(MyApp(loginRepository: loginRepository));
}

class MyApp extends StatelessWidget {
  final LoginRepository loginRepository;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyApp({super.key, required this.loginRepository});

  @override
  Widget build(BuildContext context) {
    NotificationHelper().initialize(navigatorKey);
    return MultiBlocProvider(
      providers: [
        BlocProvider<Navbloc>(create: (context) => Navbloc()),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(loginRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: LoginScreen(),
      ),
    );
  }
}
