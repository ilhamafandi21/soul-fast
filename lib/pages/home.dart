import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Timer? countdownFasting;
  String? selectedFasting;
  int duration = 0;
  List<String> variantFasting = [
    '16/8',
    '18/6',
    '24 Jam',
    '36 Jam',
    '48 Jam',
    '72 Jam',
  ];

  void stopFasting() {
    // countdownFasting?.cancel();

    countdownFasting?.cancel(); // hentikan timer
    setState(() {
      countdownFasting = null; // reset timer ke null
    });
  }

  void durationFasting() {
    switch (selectedFasting) {
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

  void startFasting() {
    if (duration > 0) {
      countdownFasting = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          duration--;
        });
        if (duration <= 1) {
          timer.cancel();
        }
      });
    }
  }

  String formatTime(int remainingSecond) {
    final hours = remainingSecond ~/ 3600;
    final minutes = (remainingSecond % 3600) ~/ 60;
    final seconds = remainingSecond % 60;

    // Format dengan 2 digit, misal 01:05:09
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SoulFast'), backgroundColor: Colors.blue),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.blue[300]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(color: Colors.blue[200]),
              child: Column(
                children: [
                  dropDownFasting(),
                  Text(formatTime(duration).()),
                  ElevatedButton(
                    onPressed: () {
                      if (countdownFasting != null &&
                          countdownFasting!.isActive) {
                        // Kalau sedang berjalan, hentikan
                        stopFasting();
                      } else {
                        // Kalau belum berjalan, mulai
                        startFasting();
                      }
                    },
                    child: Text(
                      (countdownFasting != null && countdownFasting!.isActive)
                          ? 'Cancel'
                          : 'Start',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container dropDownFasting() {
    return Container(
      height: 30,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(50),
      ),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(50),
        value: selectedFasting,
        hint: Text('Select'),
        items: variantFasting.map((value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: (e) {
          setState(() {
            countdownFasting?.cancel();

            selectedFasting = e;
            durationFasting();
          });
        },
      ),
    );
  }
}
