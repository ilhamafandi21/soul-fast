import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SoulFast!',
          style: TextStyle(fontWeight: FontWeight.w100, color: Colors.white70),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          ElevatedButton(
            style: ButtonStyle(textStyle: TextStyle(fontSize: 12)),
            onPressed: () {},
            child: Text('Mulai'),
           
          ),
        ],
      ),
    );
  }
}
