import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Home exten
      case '18/6':lected_fasting');
    final hasil = endTimeMillis! - currentTime;

    print('Selected Fasring: $selectFasting');
    print('Current Time: $currentTime');
    print('Finish Time: $endTimeMillis');
    print('Hasil: $hasil');
  }

  void stopFasting() {
    countdow
                    stopFasting();
                    selectedFasting = e;
                    duration();
                  });
                },
              ),

              ElevatedButton(
                onPressed: () {
                   saveFastingDuration(
                    durationFasting,
                    selectedFasting.toString(),
                  );
                  startFasting();
                 
                },
                child: Text('Start'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Duration Fasting: $durationFasting')],
          ),
        ],
      ),
    );
  }
}
