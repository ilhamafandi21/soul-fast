import 'package:flutter/material.dart';
import 'package:soulfast/pages/home/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('App Fasting!')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
          ),
        ),
      ),
    );
  }
}
