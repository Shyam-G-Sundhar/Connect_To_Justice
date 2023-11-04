import 'dart:async';

import 'package:ctj/screens/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect To Justice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          child: LoginPage(),
          duration: Duration(milliseconds: 300),
          type: PageTransitionType.fade,
        ),
        (route) => false,
      );
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    ));
  }
}
