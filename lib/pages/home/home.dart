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
  Timer? countd
    '36 Jam',
    '48 Jam',
    '72 Jam',
  ];

  void durationFasting() {
    switch (selectedFasting) {
      case '5 Detik':
        duration = 5;
        break;

      case '36 Jam':
        duration = 36 * 3600;
        break;
      case '48 Jam':
        duration = 48 * 3600;
        break;
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
           
                    child: Column(
                      children: [
                        Text('Select the variant fasting: '),
                        DropdownButton(
                          
                         
                              selectedFasting = e;
                              durationFasting();
                              duration;
                              stopFasting();
                            });
                          },
                        ),
                        Text(formatTime(duration)),
                        ElevatedButton(
                          
                          onPressed: () {
                            (countdownTimer != null && countdownTimer!.isActive)
                                ? stopFasting()
                                :
                        ),
                      ],
              
          ),
        ),
      ),
    );
  }
}
