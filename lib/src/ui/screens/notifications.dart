import 'package:bloc_architecture/src/models/notification_model.dart';
import 'package:bloc_architecture/src/provider/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationModel model=ModalRoute.of(context)?.settings.arguments as NotificationModel;
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'),),
      body: ChangeNotifierProvider<NotificationProvider>(

          create: (BuildContext context) => NotificationProvider(),
          builder: (context, child) {
            return Consumer<NotificationProvider>(
                builder: (context, notificationProvider, child) {
                  final String title=notificationProvider.notification.title=='empty'?model.title:"No Title";
                  final String body=notificationProvider.notification.message=='empty'?model.message:"No Message Received";

                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title,
                          style: const TextStyle(fontSize: 50),),
                        Text(body,
                            style: const TextStyle(fontSize: 40)),

                      ],
                    ),
                  );
                });
          },
      )
    );
  }
}
