import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.black,
  Colors.blueAccent,
  Colors.yellow,
  Colors.red,

];
class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false
    });//: assert( selectedColor != -1, 'Selected color must be greater than 0');
    ThemeData getTheme(){
      return ThemeData(
        useMaterial3: true,
        brightness: isDarkMode? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: false
        ),
      );
    }
  AppTheme copyWith({int? selectedColor,bool? isDarkMode}){
    return AppTheme(
      selectedColor: selectedColor ?? this.selectedColor, 
      isDarkMode: isDarkMode ?? this.isDarkMode
    );
  }
}