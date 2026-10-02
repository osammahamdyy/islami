import 'package:flutter/material.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/app_theme/app_theme.dart';
import 'package:islami/screens/onBoarding1.dart';
import 'package:islami/screens/onBoarding2.dart';
import 'package:islami/tabs/QuranTab/suraTab.dart';
import 'package:islami/screens/onBoarding3.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
       Sura.routeName: (context) => const Sura(),
       HomeScreen.routeName: (context) => const HomeScreen(),
       OnBoarding1.routeName: (context) => const OnBoarding1(),
       OnBoarding2.routeName: (context) => const OnBoarding2(),
       OnBoarding3.routeName: (context) => const OnBoarding3(),
       
      },
      home: const OnBoarding1(),
      theme: AppTheme.app_theme,
    );
     }
}
