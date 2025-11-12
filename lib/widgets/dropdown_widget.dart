import 'dart:async';

import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({super.key});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String? selectedFast;
  String? buttonText;
  int durationFasting = 0;
  Timer? countdownFast;

  void sumDurationFasting() {
    switch (selectedFast) {
      case '5 detik':
        durationFasting = 5;
        break;
      case '16/8':
        durationFasting = 16 * 3600;
        break;
      case '18/6':
        durationFasting = 18 * 3600;
        break;
      case '24 Jam':
        durationFasting = 24 * 3600;
        break;
      case '36 Jam':
        durationFasting = 36 * 3600;
        break;
      case '48 Jam':
        durationFasting = 48 * 3600;
        break;
      case '72 Jam':
        durationFasting = 72 * 3600;
        break;
      default:
        durationFasting = 0;
    }
  }

  List<String> variantFast = [
    '5 detik',
    '16/8',
    '18/6',
    '24 Jam',
    '36 Jam',
    '48 Jam',
    '72 Jam',
  ];

  void startFasting() {
    countdownFast = Timer.periodic(Duration(seconds: 1), (e) {
      setState(() {
        if (durationFasting > 0) {
          durationFasting--;
          buttonText = 'Stop';

        } else {
          e.cancel();
          buttonText = 'Pilih dulu fasting';
        }
      });
    });
  }

  void stopFasting() {
    setState(() {
      if (countdownFast!.isActive) {
        countdownFast!.cancel();
        countdownFast = null;
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
    return Column(
      children: [
        DropdownButton<String>(
          value: selectedFast,
          hint: Text('Select'),
          items: variantFast.map((listFasting) {
            return DropdownMenuItem<String>(
              value: listFasting,
              child: Text(listFasting.toString()),
            );
          }).toList(),
          onChanged: (valueSelectedFasting) {
            setState(() {
              selectedFast = valueSelectedFasting.toString();
              sumDurationFasting();
              buttonText = 'Start';
            });
          },
        ),

        ElevatedButton(
          style: ButtonStyle(
            backgrou
          child: Text(
            (countdownFast != null) ? buttonText.toString() : 'Start',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Text(formatTime(durationFasting)),
      ],
    );
  }
}
