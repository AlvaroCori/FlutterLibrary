import 'package:flutter/material.dart';
import 'package:flutter_application_app/presentation/counter/counter_functions_screen.dart';
//import 'package:flutter_application_app/presentation/counter/counter_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//Etiqueta de debug
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.lime
      ),
      home: const CounterFunctionScreen()
    );
  }

}