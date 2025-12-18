import 'package:flutter/material.dart';
import 'package:soulfast/pages/home/data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();


              Text(durationFasting.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
