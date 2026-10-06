import 'dart:math';
import 'dart:io';
import 'dart:ffi';

class Team {
  int teamNumber;
  String teamName;
  PitsScouting pitsScouting;
  List<Match> matches;


  Team({
    required this.pitsScouting,
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
      print('#1: Register a team');
      print('#2 View and edit teams');

      try {
        String input = stdin.readLineSync() ?? '';
        int parsedInput = int.parse(input);

        switch (parsedInput) {
          case 1:
            registerTeam();
          case 2:
            viewTeams();
          default:
            print('$parsedInput is not one of the options.');
        }
      } catch (e) {
        print('Enter a number.');
        continue;
      }
    }
}

void registerTeam (){}
void viewTeams(){}