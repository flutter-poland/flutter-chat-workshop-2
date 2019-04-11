import 'dart:math' as math;
import 'package:flutter/material.dart';

class ChatRoomAvatar extends StatelessWidget {
  const ChatRoomAvatar(
    this.index, {
    Key key,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 25,
            spreadRadius: -9,
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 25,
            backgroundImage:
                NetworkImage('http://lorempixel.com/200/200/cats/${math.Random().nextInt(10)}/'),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color.fromARGB(255, 117, 190, 54),
                border: Border.all(width: 1, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
