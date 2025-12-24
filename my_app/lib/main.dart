import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/login/login_screen.dart';

void main() {
  runApp(const OrenWearsApp());
}

class OrenWearsApp extends StatelessWidget {
  const OrenWearsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oren Wears',
      theme: AppTheme.lightTheme,
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
