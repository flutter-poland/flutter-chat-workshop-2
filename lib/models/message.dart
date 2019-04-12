import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

Uuid uuid = Uuid();

class Message {
  factory Message.fromSnapshot(DocumentSnapshot doc) {
    if (doc == null || !doc.exists) {
      return null;
    }

    final Timestamp timestamp = doc.data['timestamp'];

    return Message._new()
      ..id = doc.documentID
      ..content = doc.data['content']
      ..from = doc.data['from']
      ..avatar = doc.data['avatar']
      ..timestamp = timestamp.toDate();
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    final Timestamp timestamp = map['timestamp'];

    return Message._new()
      ..id = map['id']
      ..content = map['content']
      ..from = map['from']
      ..timestamp = timestamp.toDate();
  }

  factory Message.fromData(String content, String from, String avatar) {
    return Message._new()
      ..id = uuid.v4()
      ..content = content
      ..from = from
      ..avatar = avatar
      ..timestamp = DateTime.now();
  }

  Message._new();

  String id;
  String content;
  String from;
  String avatar;
  DateTime timestamp;
  bool mine = false;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'from': from,
      'timestamp': timestamp,
      'avatar': avatar,
    };
  }

  void setIsMine(bool isMine) {
    mine = isMine;
  }

  bool isMine() {
    return mine;
  }
}
