import 'dart:math';
import 'dart:io';
import 'dart:ffi';

import 'package:training_2027_project1/pits_scouting.dart';

import 'match_scouting.dart';

class Team {
  int teamNumber;
  String teamName;
  PitsScouting? pitsScouting;
  List<Match> matches;


  Team({
    this.pitsScouting,
    required this.teamNumber,
    required this.teamName,
    required this.matches,
  });
}

 class Match {
   int matchNumber;
   int autonomousScore;
   int teleopScore;
   int endgameScore;
   int fouls;

   Match({
     required this.matchNumber,
     required this.autonomousScore,
     required this.teleopScore,
     required this.endgameScore,
     required this.fouls,
 });
  }

  class PitsScouting {
   double robotHeight;
   double robotWidth;
   double robotLength;
   String drivetrainType;
   bool climbsInEndgame;

   PitsScouting ({
     required this.robotHeight,
     required this.robotWidth,
     required this.robotLength,
     required this.drivetrainType,
     required this.climbsInEndgame,
  });
  }

  List <Team> teams = [
  ];

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


String askForString(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync() ?? '';
}
double askForDouble(String prompt) {
  while (true) {
    try {
      String rawInput = askForString(prompt);
      return double.parse(rawInput);
    } catch (e) {
      print('Please enter a number');
    }
  }
}
bool askForBool(String prompt) {
  while (true) {
    try {
      String rawInput = askForString(prompt);
      return bool.parse(rawInput);
    } catch (e) {
      print('Please enter a number');
    }
  }
}
int askForInt(String prompt) {
  while (true) {
    try {
      String rawInput = askForString(prompt);
      return int.parse(rawInput);
    } catch (e) {
      print('Please enter a number');
    }
  }
}