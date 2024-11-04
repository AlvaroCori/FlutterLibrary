import 'package:flutter/material.dart';

//ctr + . to open new options
class CounterScreen extends StatefulWidget{

  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Center(child:Text('Contar', style: TextStyle(fontSize: 60, fontWeight: FontWeight.w100),),)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text("Hola", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w100),)),
          const Center(child: Text("Hola x2", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w100),)),
          Center(child: Text('$clickCounter', style: const TextStyle(fontSize: 70, fontWeight: FontWeight.w100),)),
          Center(child: Text("${clickCounter%2==0? "": "im"}par", style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w100),)),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        clickCounter = clickCounter + 1;
        setState(() {
          
        });//Update the state of the int
      },
      child: const Icon(Icons.plus_one)),
    );
  }
}