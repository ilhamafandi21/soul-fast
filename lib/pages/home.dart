import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? durationFast;
  String? valueFast;
  List<String> variantFast = [
    '16/8',
    '18/6',
    '24 Jam',
    '36 Jam',
    '48 Jam',
    '72 Jam',
  ];

  void startFasting() {
    switch (valueFast) {
      case '16/8':
        durationFast = 16;
        break;
      case '18/6':
        durationFast = 18;
        break;
      case '24 Jam':
        durationFast = 24;
        break;
      case '36 Jam':
        durationFast = 36;
        break;
      case '48 Jam':
        durationFast = 48;
        break;
      case '72 Jam':
        durationFast = 72;
        break;
      default:
        durationFast = 0;
        break;
    }
  }

  void stopFasting() {}

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
          DropdownButton<String>(
            value: valueFast,
            hint: Text('Pilih'),
            items: variantFast.map((value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
            onChanged: (e) {
              setState(() {
                valueFast = e;
              });
            },
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blue),
            ),
            onPressed: () {
              setState(() {
                startFasting();
              });
            },
            child: Text('Mulai', style: TextStyle(color: Colors.white70)),
          ),

          Text(durationFast.toString()),
        ],
      ),
    );
  }
}
