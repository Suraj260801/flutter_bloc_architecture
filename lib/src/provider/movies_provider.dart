import 'package:bloc_architecture/src/repository/repository.dart';
import 'package:flutter/material.dart';

import '../models/item_model.dart';

class MoviesProvider extends ChangeNotifier {
  final _repository = Repository();

  Future<ItemModel> fetchAllMovies() async {
    final ItemModel itemModel = await _repository.fetchAllMovies();
    return itemModel;
  }
}
