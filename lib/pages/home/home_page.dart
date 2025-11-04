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
        backgroundColor: const Color.fromARGB(255, 0, 179, 255),
      ),
      body: Container(
        decoration: BoxDecoration(
           color: const Color.fromARGB(255, 99, 208, 255),
           borderRadius: BorderRadius.circular(10)
        ),
        margin: EdgeInsets.all(10),
       
        child: DropdownButton(
          alignment: AlignmentGeometry.center,
          borderRadius: BorderRadius.circular(10),
          value: selectedVal,
          hint: Text('pilih:'),
          items: ['16/8', '18/6', 'OMAD', '36 Jam', '48 Jam', '72 Jam'].map((
            e,
          ) {
            return DropdownMenuItem(value: e, child: Text(e));
          }).toList(),
          onChanged: (e) {
            setState(() {
              selectedVal = e;
            });
          },
        ),
      ),
      // backgroundColor: Theme.of(context).colorScheme.onTertiary),
    );
  }
}
