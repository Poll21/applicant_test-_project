import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'features/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Applicant Test Project',
      theme:lateThemDate,
      home: const HomeScreen(),
    );
  }
}