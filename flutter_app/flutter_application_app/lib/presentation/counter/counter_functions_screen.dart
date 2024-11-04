import 'package:flutter/material.dart';

//ctr + . to open new options
class CounterFunctionScreen extends StatefulWidget{

  const CounterFunctionScreen({super.key});

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Center(child:Text('Contar', style: TextStyle(fontSize: 60, fontWeight: FontWeight.w100),),),

   
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text("Hola funciones", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w100),)),
          const Center(child: Text("Hola x2", style: TextStyle(fontSize: 40, fontWeight: FontWeight.w100),)),
          Center(child: Text('$clickCounter', style: const TextStyle(fontSize: 70, fontWeight: FontWeight.w100),)),
          Center(child: Text("${clickCounter%2==0? "": "im"}par", style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w100),)),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.refresh,
            onPressed: (){
              clickCounter = clickCounter + 1;
              setState(() {});
            },),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.plus_one,
            onPressed: (){
              clickCounter = clickCounter + 1;
              setState(() {});
            },),
          const SizedBox(height: 10),
          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: (){
              clickCounter = clickCounter + 1;
              setState(() {});
            },)
      ],
      )
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  const CustomButton({
    super.key, 
    required this.icon, 
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 5,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}