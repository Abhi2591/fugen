import 'package:dio/dio.dart';
import 'package:notification_app/Services/apiServices.dart';

Future<void> registerFCMonServer(String token) async {
  try {
    await Dio().post(ApiServices.register_fcm,data: {'token': token});
  } catch (e) {
    print('Error sending FCM token: $e');
  }
}