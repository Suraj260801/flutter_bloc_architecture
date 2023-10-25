import 'package:bloc_architecture/src/provider/movies_provider.dart';
import 'package:bloc_architecture/src/ui/widgets/homepage/desktop_widget.dart';
import 'package:bloc_architecture/src/ui/widgets/homepage/mobile_widget.dart';
import 'package:bloc_architecture/src/ui/widgets/homepage/tab_widget.dart';
import 'package:flutter/material.dart';
import '../../../models/item_model.dart';
import 'package:provider/provider.dart';


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
            return LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth < 500) {
                return MobileWidget(snapshot: snapshot);
              } else if (constraints.maxWidth > 500 &&
                  constraints.maxWidth < 1300) {
                return TabWidget(snapshot: snapshot);
              } else {
                return DesktopWidget(snapshot: snapshot);
              }
            });
          }
        },
      );
    });
  }
}
