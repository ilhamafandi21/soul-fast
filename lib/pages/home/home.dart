import 'package:flutter/material.dart';
import 'package:soulfast/pages/home/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Fasting!')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButton(
                hint: Text('Select'),
                value: selectedFasting,
                items: variantFasting,
                onChanged: (e) {
                  setState(() {
                    selectedFasting = e;
                  });
                },
              ),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    const Color.fromARGB(255, 2, 255, 78),
                  ),
                ),
                onPressed: () {},
                child: Text('Mulai Fasting'),
              ),

              Text(durationFasting),
            ],
          ),
        ),
      ),
    );
  }
}
