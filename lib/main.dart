import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginui/firebase_options.dart';

import 'package:loginui/main_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );  
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home: MainPage(),
    );
  }
}