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
        .add(Duration(seconds: durationFasting+2))
        .millisecondsSinceEpoch;
    prefs.setInt('endDate', endDate);

    prefs.getInt('endDate');

    timer = Timer.periodic(Duration(seconds: 1), (e){
      final now = DateTime.now().millisecondsSinceEpoch;
      final diff = endDate - now;

      if(diff <= 0){
        remainingTime = 0;
        timer?.cancel();
      }else{
        setState(() {
          remainingTime = diff ~/1000;
        });
      }
    });
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

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    startFasting();
                  });
                },
                child: Text('Mulai Fasting'),
              ),
              Text(remainingTime.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
