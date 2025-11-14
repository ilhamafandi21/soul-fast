import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int duration = 0;
  String? selectedFasting;
  List<String> variantFasting = [
    '16/8',
    '18/6',
    '24 Jam',
    '36 Jam',
    '48 Jam',
    '72 Jam',
  ];

  void durationFasting() {
    switch (selectedFasting) {
      case '16/8':
        duration = 16 * 3600;
        break;
      case '18/6':
        duration = 18 * 3600;
        break;
      case '24 Jam':
        duration = 24 * 3600;
        break;
      case '36 Jam':
        duration = 36 * 3600;
        break;
      case '48 Jam':
        duration = 48 * 3600;
        break;
      case '72 Jam':
        duration = 72 * 3600;
        break;
      default:
        duration = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SoulFast!'), backgroundColor: Colors.amber),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Container(
              height: 500,
              width: 300,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                children: [
                  DropdownButton(
                    value: selectedFasting,
                    hint: Text('Select'),
                    items: variantFasting.map((value) {
                      return DropdownMenuItem(value: value, child: Text(value));
                    }).toList(),
                    onChanged: (e) {
                      setState(() {
                        selectedFasting = e;
                      });
                    },
                  ),
                  Text('Timer'),
                  ElevatedButton(onPressed: () {}, child: Text('Start')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
