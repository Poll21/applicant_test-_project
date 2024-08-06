import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'service/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Applicant Test Project',
      theme:lateThemDate,
   routerConfig: _router.config(),
    );
  }
}