import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget{
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textController = TextEditingController();
    final focusNode = FocusNode();
    final outlinedInputBorder = UnderlineInputBorder(
          borderSide: BorderSide(color: colors.primary),
          borderRadius: BorderRadius.circular(20)
        );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "??"',
        enabledBorder: outlinedInputBorder,
        focusedBorder: outlinedInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon:  const Icon(Icons.send_outlined),
          onPressed: () {
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);
          },
        )
      );

    return TextFormField(
      onTapOutside: (event){
        //If we press outside the input, the keyboard slides off the screen
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        // ignore: avoid_print
        print("On submited");
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
      onChanged: (value) {
        // ignore: avoid_print
        print("on changed");
      },
    );
  }
  
}