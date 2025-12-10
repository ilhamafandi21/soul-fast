import 'package:flutter/material.dart';
import 'package:soulfast/pages/home/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int durationFasting = 0;

  void duration() {
    switch (selectedFasting) {
      case "5 Detik":
        durationFasting = 5;
        break;
      case "16/8":
        durationFasting = 16 * 3600;
        break;
      case "18/6":
        durationFasting = 18 * 3600;
        break;
      case "20/4":
        durationFasting = 20 * 3600;
        break;
      case "24 Jam":
        durationFasting = 24 * 3600;
        break;
      default:
        durationFasting = 0;
    }
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

              ElevatedButton(onPressed: () {}, child: Text('Mulai Fasting')),
              Text(durationFasting.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
