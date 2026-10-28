
import 'package:designs/design/responsive_layout.dart';
import 'package:designs/src/screens/check-home/check_home_screen%20_tablet.dart';
import 'package:designs/src/screens/check-home/check_home_screen.dart';
// import 'package:designs/src/screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: ResponsiveLayout(tablet: CheckHomeScreenTablet(), mobile: CheckHomeScreen()),
    );
  }
}

