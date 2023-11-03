
import 'package:bloc_architecture/src/bloc/routes/route_event.dart';
import 'package:bloc_architecture/src/bloc/routes/route_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageProvider extends Bloc<RouteEvent,RouteState> {

  HomePageProvider() : super(InitialRouteState()){
     on<ProfileRouteEvent>((event,emit)=>emit(ProfileRouteState()));
     on<NotificationRouteEvent>((event, emit) => emit(NotificationRouteState()));
     on<DashBoardRouteEvent>((event, emit) => emit(DashBoardRouteState()));
  }



  void changeState(String? newRoute) {
    if(newRoute==null){
      return;
    }
    switch(newRoute){
      case 'Profile':
        add(ProfileRouteEvent());
        break;
      case 'Notifications':
        add(NotificationRouteEvent());
        break;
      case 'DashBoard':
        add(DashBoardRouteEvent());
        break;
      default:
    }

  }
}
