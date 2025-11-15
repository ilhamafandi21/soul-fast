import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int duration = 0;
  String? selectedFasting;
  Timer? countdownTimer;
  List<String> variantFasting = [
    '5 Detik',
    '16/8',
    '18/6',
    '24 Jam',
    '36 Jam',
    '48 Jam',
    '72 Jam',
  ];

  void durationFasting() {
    switch (selectedFasting) {
      case '5 Detik':
        duration = 5;
        break;
      case '16/8':
        duration = 16 * 3600;
        break;
      case '18/6':
        duration = 18 * 3600;
        break;
      case '24 Jam':
        duration = 24 * 3600;
        break;
      case '36 Jam':
        duration = 36 * 3600;
        break;
      case '48 Jam':
        duration = 48 * 3600;
        break;
      case '72 Jam':
        duration = 72 * 3600;
        break;
      default:
        duration = 0;
    }
  }

  String formatTime(int remainingSecond) {
    final hours = remainingSecond ~/ 3600;
    final minutes = (remainingSecond % 3600) ~/ 60;
    final seconds = remainingSecond % 60;

    // Format dengan 2 digit, misal 01:05:09
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void startFasting() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (duration > 0) {
        setState(() {
          duration--;
        });
      } else if (duration == 0) {
        setState(() {
          timer.cancel();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Puasa selesai!, silhakan pilih durasi fasting baru',
              ),
            ),
          );
        });
      } else if (duration < 1) {
        setState(() {
          timer.cancel();
        });
      }
    });
  }

  void stopFasting() {
    if (countdownTimer != null && countdownTimer!.isActive) {
      setState(() {
        countdownTimer!.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SoulFast!'), backgroundColor: Colors.amber),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              height: 200,
              width: 300,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent
                    ),
                    child: Column(
                      children: [
                        Text('Select the variant fasting: '),
                        DropdownButton(
                          
                          value: selectedFasting,
                          hint: Text('Select'),
                          items: variantFasting.map((value) {
                            return DropdownMenuItem(value: value, child: Text(value));
                          }).toList(),
                          onChanged: (e) {
                            setState(() {
                              selectedFasting = e;
                  
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
