import 'package:bloc_architecture/src/models/item_model.dart';
import 'package:flutter/material.dart';
class CustomGridview extends StatelessWidget {
  const CustomGridview({super.key, required this.movies, required this.crossAxisCount});
  final List<Result> movies;
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      scrollDirection: Axis.vertical,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,

        // You can customize grid delegate further here
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount:movies.length,
            (BuildContext context, int index) {
          // Build your grid item based on the index
          return GridTile(
            child: Image.network(
              'https://image.tmdb.org/t/p/w185${movies[index].posterPath}',fit: BoxFit.fill,),);
        },
      ),
    );
  }
}
