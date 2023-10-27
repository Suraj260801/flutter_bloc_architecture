import 'package:bloc_architecture/src/models/notification_model.dart';
import 'package:bloc_architecture/src/repository/notifications_repo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier{
  final NotificationsRepo _repo=NotificationsRepo();
  late NotificationModel notification;

  NotificationProvider(){
    notification=NotificationModel(title: 'empty', message: 'empty');
    initNotification();
  }

  initNotification()async {
    final RemoteMessage? message=await _repo.getNotifications();
    if(message==null){
      notification=NotificationModel(title: "", message: "");
    }else{
      notification=NotificationModel(title: message.notification?.title??'', message: message.notification?.body??'');
    }
  }



}