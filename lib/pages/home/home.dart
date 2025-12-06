import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulfast/pages/home/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Timer? timer;
  int remainingTime = 0;
  int endTime = 0;

  void startFasting() async {
    // Save endTime
    final prefs = await SharedPreferences.getInstance();
    final endTime = DateTime.now().add(Duration(seconds: duration + 2)).millisecondsSinceEpoch;
    prefs.setInt('endTime', endTime);

      setState(() {
        if (diff <= 0) {
          timer?.cancel();
        } else {
          remainingTime = diff ~/ 1000;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fasting App')),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              DropdownButton(
                value: selectedFast,
                hint: Text('Select Fasting Type'),
                items: variantFast,
                onChanged: (e) {
                  setState(() {
                    selectedFast = e;
                    totalDuration();
                  });
                },
              ),
              Text('Selected Fast: $selectedFast'),
              Text('Total Duration (seconds): $duration'),
              Text(
                formatTime(duration).toString(),
                style: TextStyle(fontSize: 30),
              ),

              Text(remainingTime.toString(), style: TextStyle(fontSize: 30)),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue[200]),
                ),
                onPressed: () {
                  startFasting();
                },
                child: Text('Start Fast'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
