import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ButtonsScreen extends StatelessWidget {
  static const String name = "buttons_screen";
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Button Screen"),
      ),
      body: const _ButtonView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  
          context.pop();//go_router required
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded)
      ),
    );
  }
}

class _ButtonView extends StatelessWidget {
  const _ButtonView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
          ElevatedButton(onPressed: (){}, child: const Text("Elevated")),
          ElevatedButton(onPressed: (){}, child: const Text("Disabled")),
          ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.access_alarm_rounded), label: const Text("Disabled")),
          FilledButton(onPressed: (){}, child: const Text("Filled")),
          FilledButton.icon(onPressed: (){}, icon: const Icon(Icons.accessibility_outlined), label: const Text("some outlined")),
          OutlinedButton(onPressed: (){}, child: const Text("Outlined")),
          OutlinedButton.icon(onPressed: (){}, icon: const Icon(Icons.accessibility_outlined), label: const Text("outlined")),
          TextButton(onPressed: (){}, child: const Text("Text")),
          TextButton.icon(onPressed: (){}, icon: const Icon(Icons.accessibility_outlined), label: const Text("outlined")),
          IconButton(onPressed: (){}, icon: const Icon(Icons.accessibility_outlined)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.accessibility_outlined), style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(colors.primary))),
          const CustomButton()
        ])
      )
      );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Hola", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}