import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = "snackbar_screen";
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){
    ScaffoldMessenger.of(context).clearSnackBars();
    var snackBar = SnackBar(
      content: const Text("Hello"),
      action: SnackBarAction(label: "ok!", onPressed: (){}),
      duration: const Duration(seconds: 2),
      );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void openDialog(BuildContext context){
    showDialog(
      context: context, 
      barrierDismissible: false, 
      builder: (context) => AlertDialog(
        title: const Text("Esta seguro"),
        content: const Text("Esta seguro de presionar eso?"),
        actions: [
          TextButton(onPressed: (){ 
            context.pop(); 
          }, child: const Text("Cancelar")),
          FilledButton(onPressed: (){
            context.pop();
          }, child: const Text("Aceptar")),
        ],
      )
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbar"),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton.tonal(onPressed: (){
              showAboutDialog(context: context,
              children:[const Text("Element")]
              );
            }, 
            child: const Text("Licencias usadas")
          ),
            FilledButton.tonal(onPressed: (){

            }, 
            child: const Text("Mostrar dialogo")
          ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          showCustomSnackbar(context);
        }, 
        label: const Text("Mostrar Snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}