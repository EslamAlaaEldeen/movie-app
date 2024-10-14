import 'package:flutter/material.dart';
import 'package:moviesapp/core/services/services.dart';
import 'package:moviesapp/feature/screens/splash_screen.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie app',
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: Colors.grey.shade900),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
