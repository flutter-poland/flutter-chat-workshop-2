import 'package:chatapp/models/chat_room_model.dart';
import 'package:chatapp/widgets/chat_room_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

class ChatRoomsPage extends StatefulWidget {
  @override
  _ChatRoomsPageState createState() => _ChatRoomsPageState();
}

class _ChatRoomsPageState extends State<ChatRoomsPage> {
  final ChatRoomsModel _model = ChatRoomsModel();

  @override
  void initState() {
    super.initState();

    _model.fetchChatrooms();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: _model,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Center(
            child: const Text('1 new message'),
          ),
          leading: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          actions: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                FontAwesomeIcons.edit,
                size: 20,
                color: Colors.grey,
              ),
            )
          ],
        ),
        body: Container(
          child: ScopedModelDescendant<ChatRoomsModel>(
            builder: (_, __, model) {
              return ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ChatRoomListTile(
                    index: index,
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
