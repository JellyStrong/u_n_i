import 'package:flutter/material.dart';
import 'package:u_n_i/screen.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
    theme: ThemeData(
        fontFamily: "font1",
        textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
                fontFamily: "font1"))),
  ));
}
