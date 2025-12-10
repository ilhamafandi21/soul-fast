import 'dart:async';

import 'package:flutter/material.dart';
import 'package:soulfast/pages/home/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  Timer? timer;
  int timeNow = 0;

 void startFasting() {
    timeNow = DateTime.now().microsecondsSinceEpoch;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Fasting'), backgroundColor: Colors.amber),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButton(
                value: selectedFasting,
                hint: Text('Pilih Jenis Fasting'),
                items: variantFasting,
                onChanged: (e) {
                  setState(() {
                    selectedFasting = e;
                    duration();
                  });
                },
              ),

              ElevatedButton(onPressed: () {
                setState(() {
                  startFasting();
                });
              }, child: Text('Mulai Fasting')),
              Text(timeNow.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
