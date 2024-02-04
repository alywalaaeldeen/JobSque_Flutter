import 'package:flutter/material.dart';
import 'package:jobsque/Regsitration/create_account.dart';
import 'package:jobsque/Regsitration/work_type_screen.dart';
// import 'package:jobsque/home_screen.dart';
// import 'package:jobsque/onboarding_screens.dart/onboarding_screen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(1, 51,102, 255)),
        useMaterial3: true,
      ),
      home:   const WorkType()
    );
  }
}

