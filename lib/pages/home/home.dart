import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Home exten
      case '18/6':
        durationFasting = 18 * 3600;
        break;
      case '20/4':
        durationFasting = 20 * 3600;
        break;
      case '24 hours':
        durationFasting = 24 * 3600;
        break;');
    final selectFasting = prefs.getString('selected_fasting');
    final hasil = endTimeMillis! - currentTime;

    print('Selected Fasring: $selectFasting');
    print('Current Time: $currentTime');
    print('Finish Time: $endTimeMillis');
    print('Hasil: $hasil');
  }

  void stopFasting() {
    countdownTimer?.cancel();
    countdownTimer = null;
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
                    stopFasting();
                    selectedFasting = e;
                    duration();
                  });
                },
              ),

              ElevatedButton(
                onPressed: () {
                   saveFastingDuration(
                    durationFasting,
                    selectedFasting.toString(),
                  );
                  startFasting();
                 
                },
                child: Text('Start'),
              ),
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
