import 'package:flutter/material.dart';
import 'package:chatapp/screens/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat',
      theme: ThemeData(
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.grey,
      ),
      home: LoginPage(),
    );
  }
}
