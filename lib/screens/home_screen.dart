import 'package:flutter/material.dart';

class Homesscreen extends StatefulWidget {
  const Homesscreen({Key? key}) : super(key: key);

  @override
  _HomesscreenState createState() => _HomesscreenState();
}

class _HomesscreenState extends State<Homesscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("This is the home page"),
      ),
    );
  }
}
