import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedVariant;
  int durationFasting = 0;
  Timer? countdownTimer;
  List<DropdownMenuItem<String>> get variantFasting {
    List<String> variants = [
      '5 Seconds',
      '16/8',
      '18/6',
      '20/4',
      '24 hours',
      '36 hours',
      '48 hours',
    ];
    return variants
        .map(
          (variant) => DropdownMenuItem(value: variant, child: Text(variant)),
        )
        .toList();
  }

  Future<void> saveDurationFasting(int durationFastingData, String? durationSelectedFastingData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('durationFlectedFastingData: ${prefs.getString('durationSelectedFastingData')}");
  }

  void updateDurationFasting(String? variant) {
    switch (variant) {
      case '5 Seconds':
        durationFasting = 5;
        break;
      case '16/8':
        durationFasting = 16 * 3600;
        break;
      case '18/6':
        durationFasting = 18 * 3600;
        break;
      case '20/4':
        durationFasting = 20 * 3600;
        break;
      case '24 hours':
        durationFasting = 24 * 3600;
        break;
      case '36 hours':
        durationFasting = 36 * 3600;
        break;
      case '48 hours':
        durationFasting = 48 * 3600;
        break;
      default:
        durationFasting = 0;
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
    saveDurationFasting(durationFasting, selectedVariant);
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (durationFasting > 0) {
          durationFasting--;
        } else {
          countdownTimer!.cancel();
        }
      });
    });
  }

  void stopFasting() {
    setState(() {
      if (countdownTimer != null && countdownTimer!.isActive) {
        countdownTimer!.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 158, 205, 243),
        title: Text('Fasting App'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 176, 225, 255),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              spacing: 5,
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 151, 201, 242),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      DropdownButton<String>(
                        hint: Text('Select'),
                        value: selectedVariant,
                        items: variantFasting,
                        onChanged: (value) {
                          setState(() {
                            selectedVariant = value;
                            updateDurationFasting(value);
                            stopFasting();
                          });
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (countdownTimer != null &&
                              countdownTimer!.isActive) {
                            stopFasting();
                          } else {
                            startFasting();
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(
                            (countdownTimer != null && countdownTimer!.isActive)
                                ? const Color.fromARGB(255, 249, 97, 86)
                                : const Color.fromARGB(255, 58, 228, 58),
                          ),
                        ),
                        child: Text(
                          (countdownTimer != null && countdownTimer!.isActive)
                              ? 'Stop'
                              : 'Start',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 151, 201, 242),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Duration: ${formatTime(durationFasting).toString()}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
