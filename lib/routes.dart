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
        buttonColor: primaryColor,
        accentColor: Colors.teal,  //used by rflutter_alert button
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => MainPage(),
      },
    );
  }
}
