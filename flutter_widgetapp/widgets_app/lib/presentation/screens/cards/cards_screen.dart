import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  { 'elevation': 0.0, 'label': 'Elevation 0'},
  { 'elevation': 1.0, 'label': 'Elevation 1'},
  { 'elevation': 2.0, 'label': 'Elevation 2'},
  { 'elevation': 3.0, 'label': 'Elevation 3'},
  { 'elevation': 4.0, 'label': 'Elevation 4'},
  { 'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  static const String name = "cards_screen";
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Screen"),
      ),
      body: _CardsView()
    );
  }
}

class _CardsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map( (card) => _CardsTypeBase(elevation: card['elevation'], label: card['label'])),
          ...cards.map( (card) => _CardsTypeExtra(elevation: card['elevation'], label: card['label'])),
          ...cards.map( (card) => _CardsTypeFilled(elevation: card['elevation'], label: card['label'])),
          ...cards.map( (card) => _CardsTypeImage(elevation: card['elevation'], label: card['label'])),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }
}

class _CardsTypeBase extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardsTypeBase({required this.label, required this.elevation});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 8,6),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined)),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(label),
              )
            ],
          ),
        )
    );
  }
}

class _CardsTypeExtra extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardsTypeExtra({required this.label, required this.elevation});
  
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: colors.outline
        )
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 8,6),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined)),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text("$label - outlined"),
              )
            ],
          ),
        )
    );
  }
}

class _CardsTypeFilled extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardsTypeFilled({required this.label, required this.elevation});
  
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: colors.surface
        )
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 8,6),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert_outlined)),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text("$label - filled"),
              )
            ],
          ),
        )
    );
  }
}

class _CardsTypeImage extends StatelessWidget {
  final String label;
  final double elevation;

  const _CardsTypeImage({required this.label, required this.elevation});
  
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.hardEdge,//avoid the children out of the container
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: colors.surface
        )
      ),
      elevation: elevation,
      child: Stack(
        children: [
          Image.network("https://picsum.photos/id/${elevation.toInt()}/600/250",
          height: 350,
          fit: BoxFit.cover),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only( bottomLeft: Radius.circular(20)),
              ),
              child: 
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.more_vert_outlined)
                )
              ),
          ),
          
        ],
      )
    );
  }
}

