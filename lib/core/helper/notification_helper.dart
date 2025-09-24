import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<String?> getToken() async {
    String? token = await messaging.getToken();
    print("Token => $token");
    return token;
  }

  Future<void> initialize() async {
    final AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('ic_stat_download');
    final DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
        "Title:${message.notification?.title.toString()},Body: ${message.notification?.body.toString()}",
      );
      showNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(
        "Title:${message.notification?.title.toString()},Body: ${message.notification?.body.toString()}",
      );
      showNotification(message);
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails("channelId", "channelName");
    DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails();

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
  }
}

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationHelper {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<String> getTokens() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     String? token = await messaging.getToken();
//     print("Token: $token");
//     return token!;
//   }

//   Future<void> initialize() async {
//     AndroidInitializationSettings androidInitializationSettings =
//         AndroidInitializationSettings('ic_stat_download');
//     const DarwinInitializationSettings iosInitializationSettings =
//         DarwinInitializationSettings();

//     InitializationSettings initializationSettings = InitializationSettings(
//       android: androidInitializationSettings,
//       iOS: iosInitializationSettings,
//     );
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (NotificationResponse response) {},
//     );

//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       print(
//         "Message: ${message.notification?.title}\n${message.notification?.body}",
//       );
//       showNotification(
//         message.notification!.title!,
//         message.notification!.body!,
//       );
//     });

//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//       print(
//         "onOpenApp: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}",
//       );
//     });
//   }

//   Future<void> showNotification(String title, String body) async {
//     final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//         FlutterLocalNotificationsPlugin();

//     AndroidNotificationDetails androidNotificationDetails =
//         AndroidNotificationDetails(
//           'channelId',
//           'channelName',
//           importance: Importance.max,
//           priority: Priority.high,
//           ticker: 'ticker',
//         );

//     DarwinNotificationDetails iosNotificationDetails =
//         DarwinNotificationDetails();

//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: iosNotificationDetails,
//     );

//     await flutterLocalNotificationsPlugin.show(
//       0,
//       title,
//       body,
//       notificationDetails,
//     );
//   }
// }
