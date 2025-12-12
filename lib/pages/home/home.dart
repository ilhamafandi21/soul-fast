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
  int endDate = 0;
  int remainingTime = 0;

  void startFasting() async {
    final prefs = await SharedPreferences.getInstance();
    endDate = DateTime.now()
        .add(Duration(seconds: durationFasting + 1))
        .millisecondsSinceEpoch;
    prefs.setInt('endDate', endDate);

    prefs.getInt('endDate');

    timer = Timer.periodic(Duration(seconds: 1), (e) {
      final now = DateTime.now().millisecondsSinceEpoch;
      final diff = endDate - now;

      if (diff <= 0) {
        remainingTime = 0;
        timer?.cancel();
      } else {
        setState(() {
          remainingTime = diff ~/ 1000;
        });
      }
    });
  }

  void stopFasting() {
    setState(() {
      timer?.cancel();
      remainingTime = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Fasting'), backgroundColor: const Color.fromARGB(255, 226, 255, 10)),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 200,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 209, 223, 6),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 140,
                  width: 200,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 228, 255, 121),
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Column(
                    children: [
                      DropdownButton(
                  value: selectedFasting,
                  hie;
                      duration();
                      stopFasting();
                    });
                  },
                ),
            
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      startFasting();
                    });
                  },
                  child: Text('Mulai Fasting'),
                ),
                Text(
                  (timer != null && timer!.isActive)
                      ? formatTime(remainingTime)
                      : formatTime(durationFasting),
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
