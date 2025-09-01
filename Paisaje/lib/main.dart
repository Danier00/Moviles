import 'package:flutter/material.dart';
import 'package:flutter_application_1/Menu.dart';
import 'package:flutter_application_1/Header.dart';
import 'package:flutter_application_1/Tittle.dart';
import 'package:flutter_application_1/Contact.dart';
import 'package:flutter_application_1/Info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Menu(),
      body: Column(
        children: [
          Header(),
          Tittle(),
          Contact(),
          Info(),
        ],
      ),
    );
  }
}
