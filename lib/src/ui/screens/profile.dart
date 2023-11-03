import 'package:bloc_architecture/src/data/static/colors.dart';
import 'package:bloc_architecture/src/provider/profile_provider.dart';
import 'package:bloc_architecture/src/ui/bits/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shared Preferences Example"),
          backgroundColor: Colors.grey.shade400,
        ),
        body: Container(
          color: Colors.grey,
          child: ChangeNotifierProvider<ProfileProvider>(
            create: (context) => ProfileProvider(),
            builder: (context, child) {
              return Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        profileProvider.result ?? "Default",
                        style: const TextStyle(fontSize: 30),
                      ),
                      ElevatedButton(
                        style:  ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey.shade400)),
                        onPressed: () {
                          profileProvider.saveDataInSharedPrefs();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: AppColors.userSavedSuccessColor,
                              content: Text("Data saved to preferences."),
                            ),
                          );

                        },
                        child:  const CustomText(data: "Save To DB",),
                      ),
                      ElevatedButton(

                        onPressed: () {
                          profileProvider.loadDataFromSharedPrefs();
                        },
                        child:  Text("Load DB Data",style: Theme.of(context).textTheme.labelSmall,),
                      ),
                    ],
                  ),
                );
              });
            },
          ),
        ));
  }
}
