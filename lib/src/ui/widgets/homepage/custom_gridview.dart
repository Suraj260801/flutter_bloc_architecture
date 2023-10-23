import 'package:bloc_architecture/src/models/item_model.dart';
import 'package:flutter/material.dart';
class CustomGridview extends StatelessWidget {
  const CustomGridview({super.key, required this.snapshot, required this.crossAxisCount});
  final AsyncSnapshot<ItemModel> snapshot;
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,

        // You can customize grid delegate further here
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: snapshot.data?.results.length,
            (BuildContext context, int index) {
          // Build your grid item based on the index
          return GridTile(
            child: Image.network(
              'https://image.tmdb.org/t/p/w185${snapshot.data?.results[index].posterPath}',fit: BoxFit.fill,),);
        },
      ),
    );
  }
}
