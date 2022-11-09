// ignore_for_file: prefer_const_constructors

import 'package:example_app/home_page.dart';
import 'package:example_app/home_page2.dart';
import 'package:example_app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.lato().fontFamily
      ),
      home: const 
      // HomePage()
       MyHomePage(title: "Flutter")
      // LoginPage()
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

