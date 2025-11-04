import 'package:flutter/material.dart';
import 'package:soulfast/widgets/tab_overview_fasting/tab_overview_fasting.dart';

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
        child: Column(
          children: [
            Container(),
            Container(
              height: 300,
              child: TabOverviewFasting()),
          ],
        ),
      ),
    );
  }
}
