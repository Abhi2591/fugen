import 'package:flutter/material.dart';
import 'package:notification_app/screens/NotificationScreen.dart';
import 'Services/firebaseServices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebaseService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationScreen(),
    );
  }
}


