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
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,

        // You can customize grid delegate further here
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount:movies.length,
            (BuildContext context, int index) {
          // Build your grid item based on the index
          return GridTile(
            child: Card(
              elevation: 10,
              shadowColor: Colors.black,
              surfaceTintColor: Colors.black,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(

                  'https://image.tmdb.org/t/p/w185${movies[index].posterPath}',fit: BoxFit.fill,loadingBuilder: (_,Widget child,ImageChunkEvent? loadingProgress){
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );

                },),
              ),
            ),);
        },
      ),
    );
  }
}
