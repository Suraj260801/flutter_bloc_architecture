import 'package:bloc_architecture/src/models/user_model.dart';
import 'package:bloc_architecture/src/services/users_api_service.dart';

class RemoteUserRepo{

  final RemoteUserService userService=RemoteUserService();

  Future<List<UserModel>> fetchAllMovies() => userService.fetchUsersList();

}