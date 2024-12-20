import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> initializeLocalNotifications(instance) async {
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  await instance.initialize(initializationSettings);
}