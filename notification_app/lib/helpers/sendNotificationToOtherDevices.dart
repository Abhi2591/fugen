import 'package:dio/dio.dart';
import 'package:notification_app/Services/apiServices.dart';

Future<void> sendNotificationToOthers(token) async {
  if (token != null) {
    try {
      final response = await Dio().post(ApiServices.send_notifications,data: {'senderToken': token,'message': 'Test notification',},);
      print('Notification sent: ${response.data}');
    } catch (e) {
      print('Error sending notification: $e');
    }
  }
}