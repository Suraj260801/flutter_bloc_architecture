import 'package:bloc_architecture/src/provider/homepage_provider.dart';
import 'package:bloc_architecture/src/provider/profile_provider.dart';
import 'package:bloc_architecture/src/ui/screens/homepage.dart';
import 'package:bloc_architecture/src/ui/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page:()=> const HomePage()),
        GetPage(name: '/profile', page: ()=>const Profile(),transition: Transition.leftToRight),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}


