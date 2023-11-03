import 'package:bloc_architecture/src/bloc/movies_bloc.dart';
import 'package:bloc_architecture/src/models/item_model.dart';
import 'package:bloc_architecture/src/provider/movies_provider.dart';
import 'package:bloc_architecture/src/ui/pieces/responsive_layout.dart';
import 'package:bloc_architecture/src/ui/widgets/homepage/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'desktop_widget.dart';
import 'mobile_widget.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MoviesProvider>(
      create: (BuildContext context) => MoviesProvider(),
      child: const BuildList(),
    );
  }
}

class BuildList extends StatelessWidget {
  const BuildList({super.key});

  @override
  Widget build(BuildContext context) {
    ///Building Movies List Using Provider
    // return Consumer<MoviesProvider>(builder: (context, provider, child) {
    //   return FutureBuilder<ItemModel>(
    //     future: provider.fetchAllMovies(),
    //     builder: (BuildContext context, AsyncSnapshot<ItemModel> snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Text(snapshot.error.toString());
    //       } else {
    //         return LayoutBuilder(builder: (context, constraints) {
    //           if (constraints.maxWidth < 500) {
    //             return MobileWidget(snapshot: snapshot);
    //           } else if (constraints.maxWidth > 500 &&
    //               constraints.maxWidth < 1300) {
    //             return TabWidget(snapshot: snapshot);
    //           } else {
    //             return DesktopWidget(snapshot: snapshot);
    //           }
    //         });
    //       }
    //     },
    //   );
    // });

    ///Building MoviesList using Bloc
    return BlocProvider(
      create: (context) => MoviesBloc([])..fetchAllMovies(),
      child: BlocBuilder<MoviesBloc, List<Result>>(
          builder: (context, moviesModel) {
        if (moviesModel.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ResponsiveLayout(
              mobileWidget: MobileWidget(movies: moviesModel),
              tabWidget: TabWidget(movies: moviesModel),
              desktopWidget: DesktopWidget(movies: moviesModel));
        }
      }),
    );
  }
}
