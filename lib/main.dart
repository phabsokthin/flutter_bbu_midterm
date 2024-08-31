import 'package:bbu_exam/screen/e-commerce-home-2.dart';
import 'package:bbu_exam/screen/e-commerce-home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: MyEcommerce()

          //below is Screen 2

      //   home: MyEcommerce2()
    );
  }
}


