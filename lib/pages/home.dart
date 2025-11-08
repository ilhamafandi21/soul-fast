import 'package:flutter/material.dart';
import 'package:soulfast/widgets/dropdown_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SoulFast!'), backgroundColor: Colors.amber),
      body: Container(
        height: 200,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurStyle: BlurStyle.outer,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: DropdownWidget(),
      ),
    );
  }
}
