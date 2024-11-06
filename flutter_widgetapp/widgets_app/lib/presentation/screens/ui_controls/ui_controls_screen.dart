import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = "ui_controls_screen";
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controls")
      ),
      body: const _UiControlsView()
    );
  }
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();


  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantBreakfast = false;
  bool wantLunch = false;
  bool wantDinner = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text("Developer mode"),
          subtitle: const Text("Aditional controls"),
          value: isDeveloper, 
          onChanged: (value){
            
        }),
        ExpansionTile(
          title: const Text("expansion"),
          subtitle: Text("$selectedTransportation"),
          children: [
            RadioListTile(
              title: const Text("car"),
              subtitle: const Text("travel in car"),
              value: Transportation.car, 
              groupValue: selectedTransportation, 
              onChanged: (value) =>{
                setState(() {
                  selectedTransportation = Transportation.car;
                })
              }
            ),
            RadioListTile(
              title: const Text("boat"),
              subtitle: const Text("travel in boat"),
              value: Transportation.boat, 
              groupValue: selectedTransportation, 
              onChanged: (value) =>{
                setState(() {
                  selectedTransportation = Transportation.boat;
                })
              }
            ),
            RadioListTile(
              title: const Text("plane"),
              subtitle: const Text("travel in plane"),
              value: Transportation.plane, 
              groupValue: selectedTransportation, 
              onChanged: (value) =>{
                setState(() {
                  selectedTransportation = Transportation.plane;
                })
              }
            ),
            RadioListTile(
              title: const Text("submarine"),
              subtitle: const Text("travel in submarine"),
              value: Transportation.submarine, 
              groupValue: selectedTransportation, 
              onChanged: (value) =>{
                setState(() {
                  selectedTransportation = Transportation.submarine;
                })
              }
            ),
            CheckboxListTile(
              title: const Text("Wants breakfast?"),
              value: wantBreakfast, 
              onChanged: (_){
                setState(() {
                  wantBreakfast = !wantBreakfast;
                });
              }),
              CheckboxListTile(
                title: const Text("Wants lunch?"),
              value: wantLunch, 
              onChanged: (_){
                setState(() {
                  wantBreakfast = !wantLunch;
                });
              }),
            CheckboxListTile(
              title: const Text("Wants dinner?"),
              value: wantDinner, 
              onChanged: (_){
                setState(() {
                  wantBreakfast = !wantDinner;
                });
              }),
            
          ],
        ),
        
      ],
    );
  }
}