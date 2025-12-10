import 'package:flutter/material.dart';

String? selectedFasting;
List<DropdownMenuItem<String>> get variantFasting{
  List<String> fastingType = [
    "5 Detik",
    "16/8",
    "18/6",
    "20/4",
    "24 Jam",
  ];
  return fastingType.map((e){
    return DropdownMenuItem(
      value: e,
      child: Text(e));
  }).toList();
}