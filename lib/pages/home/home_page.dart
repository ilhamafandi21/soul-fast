import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      ),
        // backgroundColor: Theme.of(context).colorScheme.onTertiary),
    );
  }
}
