import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? selectedFast;
int duration = 0;

List<DropdownMenuItem<String>> get variantFast {
  List<String> fastType = [
    '5 Detik',
    '30 Detik',
    '16/8',
    '18/6',
    '20/4',
    '24 Hours',
    '5:2',
  ];
  return fastType.map((e) {
    return DropdownMenuItem(value: e, child: Text(e));
  }).toList();
}

void totalDuration() {
  switch (selectedFast) {
    case '5 Detik':
      duration = 5;
      break;
    case '30 Detik':
      duration = 30;
      break;
    case '16/8':
      duration = 16 * 3600;
      break;
    case '18/6':
      duration = 18 * 3600;
      break;
    case '20/4':
      duration = 20 * 3600;
      break;
    case '24 Hours':
      duration = 24 * 3600;
      break;
    default:
      duration = 0;
  }
}

String formatTime(int remainingSecond) {
  final hours = remainingSecond ~/ 3600;
  final minutes = (remainingSecond % 3600) ~/ 60;
  final seconds = remainingSecond % 60;
  // Format dengan 2 digit, misal 01:05:09
  return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
}


