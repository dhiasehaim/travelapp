import 'package:flutter/material.dart';
import 'package:travelapp/Page1.dart';
import 'package:travelapp/Pages/InformationPage.dart';
import 'package:travelapp/Pages/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Page1(),
    );
  }
}

