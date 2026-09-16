import 'package:api/upload_image.dart';
import 'package:flutter/material.dart';

import 'View/splash_screen.dart';
import 'example_three.dart';
import 'example_two.dart';
import 'homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      // Remove DEBUG banner
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),

      home: const SplashScreen(),
    );
  }
}