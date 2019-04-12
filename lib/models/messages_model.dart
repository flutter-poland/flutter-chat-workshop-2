import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chatapp/models/message.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessagesModel extends Model {
  MessagesModel({@required String roomId}) : _roomId = roomId {
    _subscription = Firestore.instance
        .collection('rooms/$_roomId/messages')
        .snapshots()
        .listen((_) => fetchMessages());
  }

  final String _roomId;
  StreamSubscription<QuerySnapshot> _subscription;

  List<Message> _messages = [];
  List<Message> get messages => _messages;

  Future<void> fetchMessages() async {
    final docs = await Firestore.instance
        .collection('rooms/$_roomId/messages')
        .getDocuments();

    _messages = docs.documents
        .map((doc) => Message.fromSnapshot(doc))
        .toList(growable: false);

    _messages.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    notifyListeners();
  }

  Future<void> sendMessage(String text) async {
    final prefs = await SharedPreferences.getInstance();
    final addressee = prefs.getString('user');
    final avatar = prefs.getString('avatar');

    final messageMap = Message.fromData(text, addressee, avatar).toMap();

    await Firestore.instance
        .collection('rooms/$_roomId/messages')
        .add(messageMap);

    await Firestore.instance
        .document('rooms/$_roomId')
        .updateData(<String, dynamic>{'lastMessage': messageMap});

    fetchMessages();
  }

  void dispose() {
    _subscription.cancel();
  }
}
