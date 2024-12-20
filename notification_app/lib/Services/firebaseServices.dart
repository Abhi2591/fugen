import 'package:firebase_core/firebase_core.dart';

const FirebaseOptions firebaseOptions = FirebaseOptions(
  apiKey: 'AIzaSyBQZqfRu3RuEwXqGUDnO5yxE9nM3aOmpOE',  // API Key
  appId: '1:188158089921:android:5c85686a916683038b9240',  // App ID
  messagingSenderId: '188158089921',  // Sender ID
  projectId: 'noty-e846b',  // Project ID
  storageBucket: 'noty-e846b.firebasestorage.app',  // Storage bucket
  databaseURL: 'https://noty-e846b.firebaseio.com',  // Realtime database URL (optional)
);

Future<void> initializeFirebaseService()async{
  await Firebase.initializeApp(options: firebaseOptions);
}
