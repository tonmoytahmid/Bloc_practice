import 'package:bloc_practice/features/order/screens/orderScreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
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

  Future<void> initialize(GlobalKey<NavigatorState> navigatorKey) async {
    final AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('ic_stat_download');
    final DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        String? payload = response.payload;
        if (payload != null && payload.isNotEmpty) {
          navigatorKey.currentState?.push(
            MaterialPageRoute(
              builder: (context) {
                return Orderscreen(orderId: payload);
              },
            ),
          );
        }
      },
    );

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
      
      final orderId = message.data["orderId"];
      navigatorKey.currentState?.push(
        MaterialPageRoute(
          builder: (context) {
            return Orderscreen(orderId: orderId);
          },
        ),
      );
    });
  }

  Future<void> checkForInitialMessage(BuildContext context) async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance
        .getInitialMessage();

    if (initialMessage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Orderscreen(orderId: initialMessage.data["orderId"]);
          },
        ),
      );
    }
  }

  Future<void> showNotification(RemoteMessage message) async {
    String? image = message.data['image'];

    if (image != null && image.isNotEmpty) {
      BigPictureStyleInformation bigPictureStyleInformation =
          BigPictureStyleInformation(
            FilePathAndroidBitmap(image),
            contentTitle: message.notification?.title,
            summaryText: message.notification?.body,
          );
      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
            "channelId",
            "channelName",
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
            styleInformation: bigPictureStyleInformation,
          );
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
        payload: message.data["orderId"],
      );
      return;
    } else {
      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
            "channelId",
            "channelName",
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
          );
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
        payload: message.data["orderId"],
      );
    }
  }
}
