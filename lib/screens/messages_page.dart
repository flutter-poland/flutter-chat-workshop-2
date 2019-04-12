import 'package:chatapp/models/chat_room.dart';
import 'package:chatapp/models/messages_model.dart';
import 'package:chatapp/widgets/message_cell.dart';
import 'package:chatapp/widgets/my_message_cell.dart';
import 'package:chatapp/widgets/send_message_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key key, @required this.room}) : super(key: key);

  final ChatRoom room;

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  MessagesModel _model;

  @override
  void initState() {
    super.initState();

    _model = MessagesModel(roomId: widget.room.id);
    _model.fetchMessages();
  }

  @override
  void dispose() {
    super.dispose();
    _model.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final subtitleStyle = TextStyle(fontSize: 10);

    return ScopedModel(
      model: _model,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                widget.room.name,
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
                child: ScopedModelDescendant<MessagesModel>(
                  builder: (_, __, model) {
                    return RefreshIndicator(
                      onRefresh: model.fetchMessages,
                      child: ListView.builder(
                        reverse: true,
                        itemCount: model.messages.length,
                        itemBuilder: (___, index) {
                          final message = model.messages[index];

                          if (message.isMine())
                            return MyMessageCell(message: message);
                          else
                            return MessageCell(message: message);
                        },
                      ),
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(25.0),
                child: SendMessageField(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
