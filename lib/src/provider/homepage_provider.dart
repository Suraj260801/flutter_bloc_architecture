import 'package:bloc_architecture/src/provider/route_event.dart';
import 'package:bloc_architecture/src/provider/route_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/static/constants.dart';

class HomePageProvider extends Bloc<RouteEvent,RouteState> {

  HomePageProvider() : super(InitialRouteState()){
     on<ProfileRouteEvent>((event,emit)=>emit(ProfileRouteState()));
     on<NotificationRouteEvent>((event, emit) => emit(NotificationRouteState()));
  }



  void changeState(String? newRoute) {
    if(newRoute==null){
      return;
    }
    if(newRoute==Constants.settings[0]){
      add(ProfileRouteEvent());
    }else if(newRoute==Constants.settings[1]){
      add(NotificationRouteEvent());
    }
  }
}
