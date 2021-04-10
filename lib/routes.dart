import 'package:flutter/material.dart';
import 'package:reeno_website/screens/main_page.dart';

class ReenoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const primaryColor = const Color(0xFF151026);

    return MaterialApp(
      title: 'Reeno Lesigues',
      theme: ThemeData(
        primaryColor: primaryColor,
        backgroundColor: primaryColor,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => MainPage(),
      },
    );
  }
}
