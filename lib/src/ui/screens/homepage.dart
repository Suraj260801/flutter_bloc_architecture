import 'package:bloc_architecture/src/bloc/routes/homepage_bloc.dart';
import 'package:bloc_architecture/src/bloc/routes/route_state.dart';
import 'package:bloc_architecture/src/data/static/constants.dart';
import 'package:bloc_architecture/src/models/notification_model.dart';
import 'package:bloc_architecture/src/ui/bits/custom_text.dart';
import 'package:bloc_architecture/src/ui/widgets/homepage/movies_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
        appBar: AppBar(
         backgroundColor: Colors.grey.shade400,
          actions: <Widget>[
            BlocProvider(
              create: (BuildContext context)=>HomePageProvider(),
              child: BlocConsumer<HomePageProvider,RouteState>(

                listener: (BuildContext context, RouteState state) {
                    if(state is ProfileRouteState){
                      Get.toNamed('/profile');
                    }else if(state is NotificationRouteState){
                      Get.toNamed('/notifications',arguments: NotificationModel(title: 'No Message', message: "No Discription"));
                    }

                },
                builder: (BuildContext context,RouteState state){
                  return DropdownButton<String>(
                    dropdownColor: Colors.grey.shade400,
                    focusColor: Colors.blue,
                    iconEnabledColor: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                    items: Constants.settings
                        .map<DropdownMenuItem<String>>((String item) =>
                        DropdownMenuItem(value: item, child: Text(item)))
                        .toList(),
                    onChanged: (String? newValue) async {
                      BlocProvider.of<HomePageProvider>(context).changeState(newValue);
                    },
                    icon: Icon(Icons.settings,color: Colors.grey.shade700,),
                  );
                },
              ),
            ),
          ],
          title:  const CustomText(data:"Popular Movies",fontSize: 25,),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color(0xff868f96),Color(0xff596164)])
          ),
          child: const Column(
            children: [
              Expanded(child: MovieList()),
            ],
          ),
        ));
  }
}
