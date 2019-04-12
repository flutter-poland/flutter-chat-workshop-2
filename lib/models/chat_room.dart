import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoom {
  factory ChatRoom(DocumentSnapshot doc) {
    if (doc == null || !doc.exists) {
      return null;
    }

    return ChatRoom._new()
      ..id = doc.documentID
      ..name = doc.data['name'];
  }

  ChatRoom._new();

  String id;
  String name;
}
