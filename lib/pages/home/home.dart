import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedFasting;
  List<DropdownMenuItem<String>> get variantFasting {
    List<String> fastingType = ['5 Detik', '16/8', '18/6', '24 Jam'];

    return fastingType.map((e){
      return DropdownMenuItem(
        value: e,
        child: Text(e));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Fasting!')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: DropdownButton(items: variantFasting, onChanged: (e) {
            setState(() {
              selectedFasting = e;
            });
          }),
        ),
      ),
    );
  }
}
