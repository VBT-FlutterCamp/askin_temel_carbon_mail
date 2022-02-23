import 'package:flutter/material.dart';

import 'feature/onboard/view/onboard_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color.fromRGBO(41, 56, 85, 1),
          cardColor: Color.fromARGB(250, 250, 250, 255),
          bottomAppBarColor: Color.fromARGB(250, 250, 250, 255),
          backgroundColor: Color(0x293855),
        ),
        home: OnboardView());
  }
}
