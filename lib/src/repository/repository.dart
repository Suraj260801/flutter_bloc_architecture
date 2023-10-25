import 'dart:async';
import 'package:bloc_architecture/src/services/movies_api_service.dart';

import '../models/item_model.dart';

class Repository {
  final moviesApiProvider = MoviesApiService();

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}