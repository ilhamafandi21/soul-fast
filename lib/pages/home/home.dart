import 'package:flutter/material.dart';
import 'package:soulfast/pages/home/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 \
        child: SingleChildScrollView(
          child: Column(
            children: [
              DropdownButton(
                hint: Text('Select'),
                value: selectedFasting,
                items: variantFasting,
                onChanged: (e) {
                  setState(() {
                    selectedFasting = e;
                    duration();
                  });
                },
              ),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    const Color.fromARGB(255, 2, 255, 78),
                  ),
                ),
                onPressed: () {},
                child: Text('Mulai Fasting'),
              ),

              Text(durationFasting.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
