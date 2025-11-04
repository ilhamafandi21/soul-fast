import 'package:flutter/material.dart';

class MainFastingWidget extends StatefulWidget {
  const MainFastingWidget({super.key});

  @override
  State<MainFastingWidget> createState() => _MainFastingWidgetState();
}

class _MainFastingWidgetState extends State<MainFastingWidget> {
  String? pilihanFasting;
  List<String> jenisFasting = ['16/8', '18/6', '24 Jam', '36 Jam', '48 Jam', '72 Jam'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: DropdownButton(
          value: pilihanFasting,
          hint: Text('Pilih'),
          items: jenisFasting.map((pilihan){
            return DropdownMenuItem(value: pilihan,child: Text(pilihan));
        }).toList(), onChanged: (e){
          setState(() {
            pilihanFasting = e;
          });
        }),
      ),
    );
  }
}