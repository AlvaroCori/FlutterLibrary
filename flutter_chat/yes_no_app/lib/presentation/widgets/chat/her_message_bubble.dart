import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget{
  const HerMessageBubble({super.key, required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, style: const TextStyle(color: Colors.white)),
          ),
        ),
        const SizedBox(height: 10),
        _ImageBubble( message.imageUrl ?? "https://thispersondoesnotexist.com/"),
      ],
    );
  }
  
}

class _ImageBubble extends StatelessWidget{
  const _ImageBubble(this.imageUrl);
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    //get the size of the mobile where the program is running
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      //child: Image.network("https://thispersondoesnotexist.com/",
      child: Image.network(imageUrl,
      width: size.width * 0.7,
      height: 150,
      fit: BoxFit.cover,
      loadingBuilder:(context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
          width: size.width * 0.7,
        height: 150,
        child: const Text("Enviando mensaje"),
        );
      },)
    );
  }
  
}