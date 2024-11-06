import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = "progress_screen";
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Indicator")
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height:  30,),
          Text("Circular progress indicator"),
          SizedBox(height:  10,),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.white30,),
          SizedBox(height:  30,),
          Text("Progress indicator controlled"),
          SizedBox(height:  10,),
          _ControlledProgressIndicator()
        ]
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: Stream.periodic( const Duration(milliseconds: 300), (value){
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final double progressValue = (snapshot.data ?? 0.0 ) as double;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height:  10,),
              CircularProgressIndicator(value: progressValue, strokeWidth: 2, backgroundColor: Colors.black12,),
              const SizedBox(height:  10,),
              Expanded(child: LinearProgressIndicator(value: progressValue,),)
            ]
          ),
        );
      }
    );
  }
}