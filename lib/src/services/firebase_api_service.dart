import 'package:bloc_architecture/main.dart';
import 'package:bloc_architecture/src/models/notification_model.dart';
import 'package:bloc_architecture/src/ui/screens/notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FirebaseApiService {
  ///create an instance of Firebase Messaging
  final FirebaseMessaging _firebaseInstance = FirebaseMessaging.instance;
  RemoteMessage? message;

  ///Function to initialize notifications

  Future<RemoteMessage?> initNotifications() async {
    ///request the permission from the user(will prompt user)
    await _firebaseInstance.requestPermission();

    ///fetch the FCM token for this device
    final String? fcmToken = await _firebaseInstance.getToken();

    ///print the token(normally you would like to send this to server)
    if (kDebugMode) {
      print(fcmToken);
    }
    return initPushNotifications();
  }

  ///function to handle received messages
  // void handleMessage(RemoteMessage ?message){
  //    ///if the message is null,do nothing
  //    if(message==null) return ;
  //
  //    ///redirect the user to the notifications screen with message
  //    //Get.toNamed('/notifications',arguments: message);
  //
  //
  // }
  ///function to initialize foreground and background settings
  Future<RemoteMessage?> initPushNotifications() async {
    ///handle notification if app was terminated and opened now
    FirebaseMessaging.instance.getInitialMessage().then((msg) {
      return msg;
    });

    ///FirebaseMessaging.instance.getInitialMessage().then((value)=>handleMessage(value))

    ///attach event listeners when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen((msg) {
      navigatorKey.currentState?.push(
        MaterialPageRoute(
            builder: (context) => const Notifications(),
            settings: RouteSettings(
                arguments: NotificationModel(
                    title: msg.notification?.title ?? '',
                    message: msg.notification?.body ?? ''))),
      );
    });
  }
}
