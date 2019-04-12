import 'package:chatapp/models/message.dart';
import 'package:chatapp/widgets/message_cell.dart';
import 'package:chatapp/widgets/my_message_cell.dart';
import 'package:chatapp/widgets/send_message_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    final subtitleStyle = TextStyle(fontSize: 10);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Przykładowy pokój',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Online | 2 min ago',
              style: subtitleStyle,
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(
              FontAwesomeIcons.microphone,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey.withAlpha(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(Duration(milliseconds: 300));
                },
                child: ListView.builder(
                  reverse: true,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    if (index % 2 == 0)
                      return MyMessageCell(
                          message:
                              Message.fromData('Test message', 'test', null));
                    else
                      return MessageCell(
                          message:
                              Message.fromData('Test message', 'test', null));
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: SendMessageField(),
            ),
          ],
        ),
      ),
    );
  }
}
