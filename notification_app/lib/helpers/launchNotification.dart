import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> launchNotification(RemoteMessage message, notificationInstance) async {
  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'channel_id', 'channel_name',importance: Importance.max,
    priority: Priority.high, playSound: true,
  );

  const NotificationDetails platformDetails = NotificationDetails(android: androidDetails);

  await notificationInstance.show(0, message.notification?.title, message.notification?.body, platformDetails, payload: 'item x');
}