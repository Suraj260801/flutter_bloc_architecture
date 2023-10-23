import 'package:bloc_architecture/src/ui/widgets/homepage/desktop_widget.dart';
import 'package:bloc_architecture/src/ui/widgets/homepage/mobile_widget.dart';
import 'package:bloc_architecture/src/ui/widgets/homepage/tab_widget.dart';
import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';
import 'package:provider/provider.dart';

//
// class MovieList extends StatelessWidget {
//   const MovieList({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     bloc.fetchAllMovies();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Popular Movies'),
//       ),
//       body: StreamBuilder(
//         stream: bloc.allMovies,
//         builder: (context, AsyncSnapshot<ItemModel> snapshot) {
//           if (snapshot.hasData) {
//             return buildList(snapshot);
//           } else if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           }
//           return const Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
//
//   Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
//     return GridView.builder(
//         itemCount: snapshot.data?.results.length,
//         gridDelegate:
//         const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,mainAxisSpacing: 10,crossAxisSpacing: 5),
//         itemBuilder: (BuildContext context, int index) {
//           return Container(
//             margin: const EdgeInsets.all(1),
//             child: Image.network(
//               'https://image.tmdb.org/t/p/w185'${snapshot.data
//                   ?.results[index].posterPath}',
//               fit: BoxFit.fill,
//             ),
//           );
//         });
//   }
// }

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Popular Movies'),
        ),
        body: ChangeNotifierProvider<MoviesProvider>(
          create: (BuildContext context) => MoviesProvider(),
          child: const BuildList(),
        ));
  }
}

class BuildList extends StatelessWidget {
  const BuildList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(builder: (context, provider, child) {
      return FutureBuilder<ItemModel>(
        future: provider.fetchAllMovies(),
        builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
           return LayoutBuilder(builder: (context,constraints){
             if(constraints.maxWidth<500){
               return MobileWidget(snapshot: snapshot);
             }else if(constraints.maxWidth>500&&constraints.maxWidth<1300){
               return TabWidget(snapshot: snapshot);
             }else{
               return DesktopWidget(snapshot: snapshot);
             }
           });
          }
        },
      );
    });
  }
}
