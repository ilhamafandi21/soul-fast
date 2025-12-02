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
  int remainingSeconds = 0;
  Timer? countTimer;

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

    countTimer?.cancel();

    int sisaAwal = await getRemainingSeconds();
    setState(() {
      durationFasting = sisaAwal;
    });

    countTimer = Timer.periodic(Duration(seconds: 1), (timer) async {
      int sisa = await getRemainingSeconds();

      print("Sisa: $sisa detik");

      setState(() {
        durationFasting = sisa + 0;
      });

      if (sisa <= 0) {
        timer.cancel();
        print("Fasting selesai");
      }
    });
  }

  Future<int> getRemainingSeconds() async {
    final prefs = await SharedPreferences.getInstance();
    final endTime = prefs.getInt('endTime') ?? 0;

    final now = DateTime.now().millisecondsSinceEpoch;

    final diff = endTime - now;

    if (diff <= 0) return 0;

    return diff ~/ 1000; // ms → detik
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
                        duration
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
