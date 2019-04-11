import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatapp/models/message.dart';
import 'package:chatapp/utils/design_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageCell extends StatelessWidget {
  const MessageCell({Key key, @required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: message.avatar == null
                        ? const AssetImage('assets/avatar_placeholder.png')
                        : CachedNetworkImageProvider(message.avatar),
                    radius: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                    child: Text(message.from),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [DesignHelpers.getShadow()]),
                child: Text(
                  message.content,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
