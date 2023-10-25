import 'package:flutter/cupertino.dart';

class HomePageProvider extends ChangeNotifier{
  static const List<String> _settings = [
    'Profile',
    'Notifications',
  ];

  List<String> get settings=>_settings;


}