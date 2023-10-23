import 'package:flutter/material.dart';

import '../resources/repository.dart';
import '../models/item_model.dart';

// class MoviesBloc  {
//   final _repository = Repository();
//   final _moviesFetcher = PublishSubject<ItemModel>();
//
//   Stream<ItemModel> get allMovies => _moviesFetcher.stream;
//
//   fetchAllMovies() async {
//     ItemModel itemModel = await _repository.fetchAllMovies();
//     _moviesFetcher.sink.add(itemModel);
//   }
//
//   dispose() {
//     _moviesFetcher.close();
//   }
// }
//
// final bloc = MoviesBloc();class

class MoviesProvider extends ChangeNotifier {
  final _repository = Repository();


  Future<ItemModel> fetchAllMovies() async {
    final ItemModel itemModel = await _repository.fetchAllMovies();
    return itemModel;
  }

}
