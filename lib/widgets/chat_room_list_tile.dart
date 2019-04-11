import 'package:chatapp/screens/messages_page.dart';
import 'package:chatapp/widgets/chat_room_avatar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatRoomListTile extends StatelessWidget {
  const ChatRoomListTile({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
    final subtitleStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 12);

    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 18),
            child: ListTile(
              onTap: () {
                Navigator.push<MessagesPage>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessagesPage(),
                    ));
              },
              leading: ChatRoomAvatar(index),
              title: Opacity(
                opacity: index == 0 ? 1.0 : 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Przykładowy pokój', style: titleStyle),
                    Text(
                      'Przykładowa wiadomośc',
                      style: subtitleStyle,
                    ),
                  ],
                ),
              ),
              trailing: const Text('11:45'),
            ),
          ),
        ],
      ),
    );
  }
}
