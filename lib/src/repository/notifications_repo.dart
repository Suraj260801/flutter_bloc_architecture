import 'package:bloc_architecture/src/services/firebase_api_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationsRepo {
  final FirebaseApiService service = FirebaseApiService();

  Future<RemoteMessage?> getNotifications() {
    return service.initNotifications();
  }
}
