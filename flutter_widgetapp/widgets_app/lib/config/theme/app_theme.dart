import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.black,
  Colors.blueAccent,
  Colors.yellow,
  Colors.red,

];
class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
    });//: assert( selectedColor != -1, 'Selected color must be greater than 0');
    ThemeData getTheme(){
      return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: false
        ),
      );
    }
}