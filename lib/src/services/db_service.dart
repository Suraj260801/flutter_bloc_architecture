import 'package:shared_preferences/shared_preferences.dart';

class DBService{
  late final SharedPreferences preferences;
  DBService(){
    initDBService();
  }
  initDBService() async {
    preferences=await SharedPreferences.getInstance();
  }


  String? loadDataFromSharedPrefs(String key) {
    return preferences.getString(key);
  }
}
