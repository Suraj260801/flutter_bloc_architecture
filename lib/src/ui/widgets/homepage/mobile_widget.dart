import 'package:bloc_architecture/src/models/item_model.dart';
import 'package:bloc_architecture/src/ui/widgets/homepage/custom_gridview.dart';
import 'package:flutter/material.dart';

class MobileWidget extends StatelessWidget {
  const MobileWidget({super.key, required this.movies});

  final List<Result> movies;

  @override
  Widget build(BuildContext context) {
    return CustomGridview(movies: movies, crossAxisCount: 2);
  }
}
