import 'dart:async';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String? valueFast; 
  List<String> jenisFasting = [
    '16/8',
    '18/6',
    '24 Jam',
    '36 Jam',
    '48 Jam',
    '72 Jam',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SoulFast!',
          style: TextStyle(fontWeight: FontWeight.w100, color: Colors.white70),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          DropdownButton(
            value: jenisFasting,
            hint: Text('Pilih'),
            items: jenisFasting.map((value){
              return DropdownMenuItem(
                value: value,
                child: Text(value));
            }).toList(), onChanged: (e){}),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.blue),
            ),
            onPressed: () {},
            child: Text('Mulai', style: TextStyle(color: Colors.white70),),
           
          ),
        ],
      ),
    );
  }
}
