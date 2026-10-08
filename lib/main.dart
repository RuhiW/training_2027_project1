import 'dart:io';

import 'match_scouting.dart';
import 'pits_scouting.dart';





void runCli(List<String> arguments) {
  print(' Welcome to the Bear Metal Scouting App! ');

    while (true) {
      print('Choose an option: ');
      print('#1: Pits Scouting');
      print('#2 Match Scouting');

      try {
        String input = stdin.readLineSync() ?? '';
        int parsedInput = int.parse(input);

        switch (parsedInput) {
          case 1:
            runPitsScouting();
          case 2:
            runMatchScouting();
          default:
            print('$parsedInput is not one of the options.');
        }
      } catch (e) {
        print('Enter a number.');
        continue;
      }
    }
}

