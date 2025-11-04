import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedVal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: const Color.fromARGB(255, 238, 255, 0),
      ),
      body: Container(
        width: double.infinity,
        height: 200,
        color: const Color.fromARGB(255, 212, 227, 0),
        child: DropdownButton(
          value: selectedVal,
          hint: Text('Pilih Jenis Fasting: '),
          items: ['16/8', '18/6', 'OMAD', '36 Jam', '48 Jam', '72 Jam'].map((
            e,
          ) {
            return DropdownMenuItem(value: e, child: Text(e));
          }).toList(),
          onChanged: (e) {},
        ),
      ),
      // backgroundColor: Theme.of(context).colorScheme.onTertiary),
    );
  }
}
