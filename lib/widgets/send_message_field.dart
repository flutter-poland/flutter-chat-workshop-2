import 'package:chatapp/models/messages_model.dart';
import 'package:chatapp/utils/design_helpers.dart';
import 'package:chatapp/widgets/send_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendMessageField extends StatefulWidget {
  const SendMessageField({Key key, @required this.model}) : super(key: key);

  final MessagesModel model;

  @override
  State<StatefulWidget> createState() => _SendMessageFieldState(model);
}

class _SendMessageFieldState extends State<SendMessageField> {
  _SendMessageFieldState(this.model) : textController = TextEditingController();

  final TextEditingController textController;
  final MessagesModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          DesignHelpers.getShadow(),
        ],
      ),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40),
          ),
          fillColor: Colors.white,
          hintText: 'Type your message...',
          hintStyle: TextStyle(fontSize: 12),
          filled: true,
          suffixIcon: SendIcon(onPressed: sendMessage),
        ),
      ),
    );
  }

  void sendMessage() {
    if (textController.text.isEmpty) {
      return;
    }

    model.sendMessage(textController.text);
    textController.clear();
  }
}
