import 'package:bloc_architecture/src/repository/user_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  static const String _key = 'name';
  final String _value = 'Suraj';
  String? result;
  final UserRepository userRepository=UserRepository();

  late final SharedPreferences preferences;

  ProfileProvider() {
    initSharedPrefs();
  }

  String get key => _key;

  String get value => _value;



  initSharedPrefs() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveDataInSharedPrefs() async {
    await preferences.setString(_key, _value);
  }

  loadDataFromSharedPrefs() {
    result = userRepository.fetchUserDataFromDb(_key);
    notifyListeners();
  }
}
