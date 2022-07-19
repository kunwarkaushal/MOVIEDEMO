import 'package:flutter/material.dart';
import 'loginpage.dart';

void main() {
  runApp(ShowApp());
}

class ShowApp extends StatefulWidget {
  const ShowApp({Key? key}) : super(key: key);

  @override
  State<ShowApp> createState() => _ShowAppState();
}

class _ShowAppState extends State<ShowApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff1A6350),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
