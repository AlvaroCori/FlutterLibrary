import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();
  List<Message> message = [
    Message(text: "Hello there", fromWho: FromWho.mine),
    Message(text: "How are you?", fromWho: FromWho.mine),
  ];

  Future<void> sendMessage(String text) async{
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.mine);
    if (text.endsWith("?")){
      herReply();
    }
    message.add(newMessage);
    notifyListeners();
    moveScrollToBotton();
  }
  Future<void> herReply() async{
    final herMessage = await getYesNoAnswer.getAnswer();
    message.add(herMessage);
    notifyListeners();

    moveScrollToBotton();
  }

  Future<void> moveScrollToBotton() async{

    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 500), 
      curve: Curves.easeOutSine);
  }
}