import 'package:bloc_architecture/src/models/item_model.dart';
import 'package:bloc_architecture/src/models/movies_model.dart';
import 'package:bloc_architecture/src/repository/movies_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Cubit<List<Result>>{
  final _repository = MoviesRepository();

  MoviesBloc(super.initialState);

  Future<void> fetchAllMovies() async{

      final ItemModel itemModel = await _repository.fetchAllMovies();
      emit(itemModel.results);
  }
}