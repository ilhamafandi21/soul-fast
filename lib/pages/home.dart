import 'dart:async';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedFast;
  int durationToSecond = 0;
  int remainingSecond = 0;
  Timer? countdownTimer;
  List<String> variantFast = [
    '16/8',
    '18/6',
    '24 Jam',
    '36 Jam',
    '48 Jam',
    '72 Jam',
  ];



  void startFasting() {
    switch (selectedFast) {
      case '16/8':
        durationToSecond = 16 * 3600;
        break;
      case '18/6':
        durationToSecond = 18 * 3600;
        break;
      case '24 Jam':
        durationToSecond = 24 * 3600;
        break;
      case '36 Jam':
        durationToSecond = 36 * 3600;
        break;
      case '48 Jam':
        durationToSecond = 48 * 3600;
        break;
      case '72 Jam':
        durationToSecond = 72 * 3600;
        break;
      default:
        durationToSecond = 0 * 3600;
    }

    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (durationToSecond > 0) {
        setState(() {
          durationToSecond--;
        });
      } else {
        timer.cancel();
      }
    });
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
      appBar: AppBar(
        title: Text('SoulFast!'),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Container(
        height: 200,
        width: 200,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 30,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.cyan[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: DropdownButton(
                underline: SizedBox(),
                padding: EdgeInsets.only(left: 10),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                dropdownColor: Colors.cyan[300],
                value: selectedFast,
                hint: Text('Select', style: TextStyle(fontSize: 14)),
                items: variantFast.map((value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value, style: TextStyle(fontSize: 14)),
                  );
                }).toList(),
                onChanged: (e) {
                  setState(() {
                    selectedFast = e;
                  });
                },
              ),
            ),
            Text(textTimer() ?? 'belum set pilihan'),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.cyan[100]),
              ),
              onPressed: () {
                startFasting();
              },
              child: Text('Mulai'),
            ),
          ],
        ),
      ),
    );
  }
}
