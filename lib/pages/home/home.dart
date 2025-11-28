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
  Timer? countdownTimer;

  List<String> variantFasting = [
    '5 Detik',
    '16/8',
    '18/6',
    '20/4',
    '24 hours',
    '5:2',
  ];

  void duration() {
    switch (selectedFasting) {
      case '5 Detik':
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
      case '5:2':
        durationFasting = 48 * 3600;
        break;
      default:
        durationFasting = 0;
    }
  }

  Future<void> saveFastingDuration(int duration, String selectFasting) async {
    // Simpan durasi puasa ke penyimpanan lokal atau basis data
    final prefs = await SharedPreferences.getInstance();
    final endTime =  DateTime.now().add(Duration(seconds: duration));
    await prefs.setInt('fasting_duration', duration);
    await prefs.setInt('fasting_close', endTime.second);
    await prefs.setString('selected_fasting', selectFasting);
    print('Fasting duration saved: $duration seconds for $selectFasting');
    print('Fasting EndTime: $endTime');
  }

  void startFasting() async {
    final prefs = await SharedPreferences.getInstance();
    final endTime = await prefs.getInt('fasting_close') ?? 0;
    print('Fasting will end at second: $endTime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fasting App!'),
        backgroundColor: Colors.blue[300],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                value: selectedFasting,
                hint: Text('Select'),
                items: variantFasting.map((e) {
                  return DropdownMenuItem(value: e, child: Text(e));
                }).toList(),
                onChanged: (e) {
                  setState(() {
                    selectedFasting = e;
                    duration();

                    saveFastingDuration(
                      durationFasting,
                      selectedFasting.toString(),
                    );
                  });
                },
              ),

              ElevatedButton(onPressed: () {
                startFasting();
              }, child: Text('Start')),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Duration Fasting: $durationFasting')],
          ),
        ],
      ),
    );
  }
}
