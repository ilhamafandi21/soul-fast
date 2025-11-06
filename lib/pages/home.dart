import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int durationFastToSecond = 0;
  int remainingSecond = 0;
  Timer? countdownTimer;

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
        durationFastToSecond = 16 * 3600;
        break;
      case '18/6':
        durationFastToSecond = 18 * 3600;
        break;
      case '24 Jam':
        durationFastToSecond = 24 * 3600;
        break;
      case '36 Jam':
        durationFastToSecond = 36 * 3600;
        break;
      case '48 Jam':
        durationFastToSecond = 48 * 3600;
        break;
      case '72 Jam':
        durationFastToSecond = 72 * 3600;
        break;
      default:
        durationFastToSecond = 0 * 3600;
        break;
    }

    setState(() {
      remainingSecond = durationFastToSecond;
    });

    countdownTimer = Timer.periodic(Duration(seconds: 1), (e) {
      if (remainingSecond > 0) {
        setState(() {
          remainingSecond--;
        });
      } else {
        e.cancel();
      }
    });
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

          Text(durationFastToSecond.toString()),
        ],
      ),
    );
  }
}
