import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import 'theme.dart';

class KindlingEdTech extends StatelessWidget {
  const KindlingEdTech({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EdTech',
      theme: AppTheme.light,
      home: const SplashScreen(),
    );
  }
}