// class CurrentRouteState{
//   final String currentRoute;
//   CurrentRouteState(this.currentRoute);
// }
abstract class RouteState {}

class InitialRouteState extends RouteState{}

class ProfileRouteState extends RouteState {}

class NotificationRouteState extends RouteState {}

class DashBoardRouteState extends RouteState{}
