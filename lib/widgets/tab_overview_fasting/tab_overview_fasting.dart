import 'package:flutter/material.dart';

class TabOverviewFasting extends StatefulWidget {
  const TabOverviewFasting({super.key});

  @override
  State<TabOverviewFasting> createState() => _TabOverviewFastingState();
}

class _TabOverviewFastingState extends State<TabOverviewFasting> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicator: BoxDecoration(
              border: BoxBorder.all(
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            tabs: <Widget>[
              Container(color: Colors.blue, child: Text('Fasting Effect')),
              Text('Refeed'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(child: Text("It's cloudy here")),
            Center(child: Text("It's cloudy here")),
          ],
        ),
      ),
    );
  }
}
