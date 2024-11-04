import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 104, 18, 243);

const List<Color> _colorThemes = [
  _customColor,
  Colors.black,
  Colors.blue,
  Colors.yellow,
  Colors.orange,
  Colors.white
];
class AppTheme{
  final int selectedColor;
  AppTheme({
    this.selectedColor = 0
  }): assert(selectedColor >= 0 && selectedColor < _colorThemes.length - 1, "Color must be between 0 to ${_colorThemes.length}");
  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.dark
    );
  }
}