import 'package:bakurubey_tharujama/style_elements.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primaryColor: primeColor,
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.grey[600],
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            color: lightCardColor,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          labelStyle: const TextStyle(
            fontFamily: 'Waheed',
            fontSize: 20.0,
          ),
          labelPadding: const EdgeInsets.symmetric(horizontal: 35.0),
          labelColor: Colors.white,
          unselectedLabelStyle: const TextStyle(
            fontFamily: 'Waheed',
            fontSize: 18.0,
          ),
        ),
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: 10.0,
          elevation: 0.0,
          backgroundColor: bgColor,
          titleTextStyle: TextStyle(
            color: primeColor,
            fontFamily: 'Midhili',
            fontSize: 25,
          ),
          centerTitle: true,
        ),
      ),
      home: MyHomePage(title: title),
    );
  }
}
