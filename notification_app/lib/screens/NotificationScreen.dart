import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../helpers/launchNotification.dart';
import '../helpers/localNotificationInitializer.dart';
import '../helpers/registerFCM.dart';
import '../helpers/sendNotificationToOtherDevices.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  String? _fcmToken;

  @override
  void initState() {
    super.initState();
    _initializeFCM();
    initializeLocalNotifications(_flutterLocalNotificationsPlugin);
  }

  Future<void> _initializeFCM() async {
    await _firebaseMessaging.requestPermission();
    _firebaseMessaging.getToken().then((token) {setState(() {_fcmToken = token;});
      if (_fcmToken != null) registerFCMonServer(_fcmToken!);
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {launchNotification(message, _flutterLocalNotificationsPlugin);});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: ()=> {sendNotificationToOthers(_fcmToken)},
          child: const Text('Send Notification'),
        ),
      ),
    );
  }
}