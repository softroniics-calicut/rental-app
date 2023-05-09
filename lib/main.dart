import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';
import 'main menu-user.dart';
import 'main menu.dart';



//import 'Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:logo(),
    );
  }
}