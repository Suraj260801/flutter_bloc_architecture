import 'package:flutter/material.dart';

final ThemeData appTheme=ThemeData(
  primarySwatch: Colors.grey,
  useMaterial3: true,
  textTheme: const TextTheme(labelSmall: TextStyle(color: Colors.purple,fontSize: 12,fontWeight: FontWeight.bold)),
  primaryColor: Colors.blue,
  buttonTheme: const ButtonThemeData(buttonColor: Colors.green,disabledColor: Colors.blue)
);