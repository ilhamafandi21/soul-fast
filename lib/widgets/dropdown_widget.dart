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
  Timer? co
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
            backgroundColor: WidgetStatePropertyAll(Colors.blue),
          ),
          onPressed: () {
            (countdownFast != null && countdownFast!.isActive)
                ? stopFasting()
                : startFasting();
          },
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
