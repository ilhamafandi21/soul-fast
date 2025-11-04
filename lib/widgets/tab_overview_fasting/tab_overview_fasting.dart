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
            tabs: <Widget>[
              Text('Fasting Effect'),
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
