import 'package:bloc_architecture/src/data/static/constants.dart';
import 'package:bloc_architecture/src/provider/homepage_provider.dart';
import 'package:bloc_architecture/src/ui/widgets/homepage/movies_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            DropdownButton<String>(
              items: Constants.settings
                  .map<DropdownMenuItem<String>>((String item) =>
                      DropdownMenuItem(value: item, child: Text(item)))
                  .toList(),
              onChanged: (String? newValue) => Get.toNamed('/profile'),
              icon: const Icon(Icons.settings),
            ),
          ],
          title: const Text('Popular Movies'),
        ),
        body: ChangeNotifierProvider(
            create: (context) => HomePageProvider(),
            builder: (context, child) {
              return Consumer(builder: (context, homepageProvider, child) {
                return const Column(
                  children: [
                    Expanded(child: MovieList()),
                  ],
                );
              });
            }));
  }
}
