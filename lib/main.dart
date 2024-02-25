import 'package:flutter/material.dart';
import 'package:jobsque/screens/Applied/applied_screen.dart';
import 'package:jobsque/screens/HomeScreen/home_screen.dart';
import 'package:jobsque/screens/Job%20Detail/bio_data.dart';
import 'package:jobsque/screens/Job%20Detail/job_detail.dart';
import 'package:jobsque/screens/Job%20Detail/upload_portfolio.dart';
import 'package:jobsque/screens/SplashScreen/splash_screen.dart';

import 'package:jobsque/screens/onboarding_screens.dart/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(1, 51, 102, 255)),
          useMaterial3: true,
        ),
        home: const JobDetail());
  }
}
