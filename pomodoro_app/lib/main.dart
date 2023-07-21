import 'package:flutter/material.dart';
import 'view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      debugShowCheckedModeBanner: false,
      title: 'Pomodoro App',
      initialRoute: '/home',
      routes: {
        '/home':(context) => Home()
      },
    );
  }
}
