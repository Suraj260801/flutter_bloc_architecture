import 'dart:async';
import 'dart:convert';

import 'package:bloc_architecture/src/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;

class RemoteUserService {
  Client client = Client();
  static const String url="https://jsonplaceholder.typicode.com/users";
  final Uri uri=Uri.parse(url);

  Future<List<UserModel>> fetchUsersList() async {
    final response = await client
        .get(uri);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      final List<dynamic> json=jsonDecode(response.body);
      final List<UserModel> users=json.map((dynamic map)=>UserModel.fromJson(map)).toList();
      if(kDebugMode){
        print(users);
      }
      return users;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load Users');
    }
  }
}