import 'package:bloc_architecture/firebase_options.dart';
import 'package:bloc_architecture/src/services/firebase_api_service.dart';
import 'package:bloc_architecture/src/ui/bits/button_theme.dart';
import 'package:bloc_architecture/src/ui/screens/dash_board.dart';
import 'package:bloc_architecture/src/ui/screens/homepage.dart';
import 'package:bloc_architecture/src/ui/screens/notifications.dart';
import 'package:bloc_architecture/src/ui/screens/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
final navigatorKey=GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      navigatorKey: navigatorKey,
      getPages: [
        GetPage(name: '/', page:()=> const HomePage()),
        GetPage(name: '/profile', page: ()=>const Profile(),transition: Transition.leftToRight),
        GetPage(name: '/notifications', page: ()=>const Notifications(),transition: Transition.leftToRight),
        GetPage(name: '/dashboard', page: ()=>const DashBoard()),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: appTheme,
      home: const HomePage(),
    );
  }
}


