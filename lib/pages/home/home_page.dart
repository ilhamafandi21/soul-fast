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
        height: 150,
        decoration: BoxDecoration(
          color: Color.fromARGB(57, 138, 116, 116),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
