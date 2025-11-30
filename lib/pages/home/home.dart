import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Home exten
      case '18/6':
        durationFasting = 18 * 3600;
        break;
      case '20/4':
        durationFasting = 20 * 3600;
        break;
      case '24 hours':
        durationFasting = 24 * 3600;
        break;');
    final selectFasting = prefs.getString('selected_fasting');
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

              Elev
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
