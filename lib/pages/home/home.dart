import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedFasting; 
  List<String> variantFasting = [
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
                    items: variantFasting.map((value){
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value));
                    }).toList(),
                    onChanged: (e) {
                      setState(() {
                        selectedFasting = e;
                      });
                    },
                  ),
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
