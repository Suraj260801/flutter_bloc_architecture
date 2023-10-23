import 'package:bloc_architecture/src/ui/movies_list.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: MovieList(),
      ),
    );
  }
}
