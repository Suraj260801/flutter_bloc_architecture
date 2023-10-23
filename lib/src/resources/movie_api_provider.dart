import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  static const String url="http://api.themoviedb.org/3/movie/popular?api_key=e2b5c7b5e09c1b1dcd1bff4c5debdaa9";
  final Uri uri=Uri.parse(url);

  Future<ItemModel> fetchMovieList() async {
    final response = await client
        .get(uri);
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}