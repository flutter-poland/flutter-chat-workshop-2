import 'dart:math' as math;
import 'package:chatapp/screens/chat_rooms_page.dart';
import 'package:chatapp/utils/design_helpers.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final userAvatar = 'http://lorempixel.com/200/200/cats/${math.Random().nextInt(10)}/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(userAvatar),
              radius: 50,
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(40),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(40),
                ),
                hintText: 'nickname',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                color: Colors.lightBlue,
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('user', usernameController.text);
                  await prefs.setString('avatar', userAvatar);

                  Navigator.push<ChatRoomsPage>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatRoomsPage(),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
