import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedVal;
  List<String> jenisFasting = ['16/8', '18/6', 'OMAD', '36', '48', '72'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(5),
        height: 200,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: DropdownButton(
                value: selectedVal,
                hint: Text('Pilih'),
                items: jenisFasting.map((pilihan) {
                  return DropdownMenuItem(value: pilihan, child: Text(pilihan));
                }).toList(),
                onChanged: (e) {
                  setState(() {
                    selectedVal = e;
                  });
                },
              ),
            ),
            Container(child: Text(selectedVal ?? 'Silahkan pilih jenis fasting')),
          ],
        ),
      ),
    );
  }
}
