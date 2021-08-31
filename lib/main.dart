import 'package:flutter/material.dart';
import 'package:realestate/screens/detail.dart';
import 'package:realestate/screens/home.dart';
import 'package:realestate/screens/mapScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Home(),
      routes: {
        '/': (context) => Home(),
        '/DetailPage': (context) => DetailPage(),
        '/MapScreen': (context) => MapPage(),
      },
    ),
  );
}
