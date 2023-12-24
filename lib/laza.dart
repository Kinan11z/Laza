import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:laza/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Laza(),
    );
  }
}

class Laza extends StatelessWidget {
  const Laza({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Welcome(),
          ));
    });
    return Scaffold(
      backgroundColor: Color.fromRGBO(151, 117, 250, 1),
      body: Container(
          alignment: Alignment.center, child: Image.asset('asset/laza.png')),
    );
  }
}
