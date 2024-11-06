import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});
  static const String name = "counter_screen";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clickCounter = ref.watch( counterProvider);
    final isDarkMode = ref.watch( isDarkModeProvider );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
        actions: [
          IconButton(
            onPressed: (){
              ref.read(isDarkModeProvider.notifier).update((state) => !state);
            }, 
            icon: Icon(isDarkMode? Icons.light_mode_outlined : Icons.dark_mode_outlined))
        ],
      ),
      body: Center(
        child: Text("valor $clickCounter", style: Theme.of(context).textTheme.titleLarge ),
        
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.read( counterProvider.notifier ).state ++;
        //ref.read(counterProvider.notifier).update((state) => state + 1);
      }, child: const Icon(Icons.add),),
    );

  }
}