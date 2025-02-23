import 'package:flutter/material.dart';
import 'package:todo/features/home/home.dart';
import 'package:todo/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'You Do You',
      debugShowCheckedModeBanner: false, theme: AppTheme.darkTheme(context),
      // Dark theme is inclided in the Full template
      themeMode: ThemeMode.light,

      home: const HomeScreen(),
    );
  }
}
