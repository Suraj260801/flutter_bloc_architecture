import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider extends ChangeNotifier {
  static const String _key = 'name';
  final String _value = 'Suraj';
  String? result;
  late ProfileProvider _profileProvider;

  late final SharedPreferences preferences;

  ProfileProvider() {
    initSharedPrefs();
  }

  String get key => _key;

  String get value => _value;

  ProfileProvider get profileProvider=>_profileProvider;

  initProvider(ProfileProvider provider){
    _profileProvider=provider;
  }

  initSharedPrefs() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveDataInSharedPrefs() async {
    await preferences.setString(_key, _value);
  }

  loadDataFromSharedPrefs() {
    result = preferences.getString(_key);
    notifyListeners();
  }
}
