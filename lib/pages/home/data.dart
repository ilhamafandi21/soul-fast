 import 'package:flutter/material.dart';

int durationFasting = 0;
  String? selectedFasting;
  List<DropdownMenuItem<String>> get variantFasting {
    List<String> fastingType = ['5 Detik', '16/8', '18/6', '24 Jam'];
    return fastingType.map((e) {
      return DropdownMenuItem(value: e, child: Text(e));
    }).toList();
  }

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
      case '24 Jam':
        durationFasting = 24 * 3600;
        break;
      default:
        durationFasting = 0;
    }
  }
