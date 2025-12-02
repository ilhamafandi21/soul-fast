import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedFasting;
  int durationFasting = 0;
  int countdownTimer = 0;

  List<DropdownMenuItem<String>> get variantFasting {
    List<String> fastingType = ["5 Detik", "16/8", "18/6", "20/4"];
    return fastingType.map((e) {
      return DropdownMenuItem(value: e, child: Text(e));
    }).toList();
  }

  void duration() {
    switch (selectedFasting) {
      case "5 Detik":
        durationFasting = 5;
        break;
      case "16/8":
        durationFasting = 16 * 3600;
        break;
      case "18/6":
        durationFasting = 18 * 3600;
        break;
      case "20/4":
        durationFasting = 20 * 3600;
        break;
      default:
        durationFasting = 0 * 3600;
    }
  }

  Future<void> startFasting() async {
    final prefs = await SharedPreferences.getInstance();
    final endTime = DateTime.now()
        .add(Duration(seconds: durationFasting))
        .millisecondsSinceEpoch;

    await prefs.setInt('endTime', endTime);
    print("EndTime Saved: $endTime");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  DropdownButton(
                    hint: Text('Select'),
                    items: variantFasting,
                    value: selectedFasting,
                    onChanged: (value) {
                      setState(() {
                        selectedFasting = value;
                        duration();
                      });
                    },
                  ),
                  Text(selectedFasting ?? 'No Fasting Selected'),
                  Text(durationFasting.toString()),

                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      startFasting();
                    },
                    child: Text('Start'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
