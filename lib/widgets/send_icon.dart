import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SendIcon extends StatelessWidget {
  const SendIcon({
    @required VoidCallback onPressed,
    Key key,
  })  : _onPressed = onPressed,
        super(key: key);

  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6.0),
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: const Color.fromARGB(255, 241, 241, 241),
      ),
      child: IconButton(
          onPressed: _onPressed,
          iconSize: 18,
          icon: const Icon(
            FontAwesomeIcons.solidPaperPlane,
            color: Colors.black45,
          )),
    );
  }
}
