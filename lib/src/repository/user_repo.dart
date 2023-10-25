import 'package:bloc_architecture/src/services/db_service.dart';

class UserRepository {
  final DBService service = DBService();

  String? fetchUserDataFromDb(String key) {
    return service.loadDataFromSharedPrefs(key);
  }

}
