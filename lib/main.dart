import 'dart:math';
import 'dart:io';
import 'dart:ffi';

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

void runMatchScouting() {}

void scoutPits() {
  print('Scouting a team:');
  print('');

  int teamNumber = askForInt('Enter a team number: ');
  String teamName = askForString('Enter a team name: ');
  double robotHeight = askForDouble('Enter the robot height: ');
  double robotWidth = askForDouble('Enter the robot width: ');
  double robotLength = askForDouble('Enter the robot length: ');
  String drivetrainType = askForString('Enter the drivetrain type: ');
  bool climbsInEndgame = askForBool('Does the robot climb in endgame, true or false?: ');

  PitsScouting pitData = PitsScouting(
    robotHeight: robotHeight,
    robotWidth: robotWidth,
    robotLength: robotLength,
    drivetrainType: drivetrainType,
    climbsInEndgame: climbsInEndgame,
  );

  teams.add(
    Team(
      teamNumber: teamNumber,
      teamName: teamName,
      pitsScouting: pitData,
      matches: [],
    ),
  );

  print('Added $teamName to registered teams');
}

void runPitsScouting() {
  while (true) {
    print('Choose an option: ');
    print('#1 Scout a team');
    print('#2 View & Edit teams');
    print('');
    stdout.write('Select option: ');

    try {
      String input = stdin.readLineSync() ?? '';
      int parsedInput = int.parse(input); // Convert string to int

      switch (parsedInput) {
        case 1:
          scoutPits();
        case 2:
          viewTeams();
        default:
          print('$parsedInput is not an option!');
      }
    } catch (e) {
      print('Enter a number!');
      continue;
    }
  }
}


void viewTeams() {
  int teamNumber = askForInt('Enter the team number you want to view: ');

  for (Team team in teams) {
    if (team.teamNumber == teamNumber) {
      print('Team ${team.teamNumber}: ${team.teamName}');
      print('Height: ${team.pitsScouting?.robotHeight}');
      print('Width: ${team.pitsScouting?.robotWidth}');
      print('Length: ${team.pitsScouting?.robotLength}');
      print('Drivetrain: ${team.pitsScouting?.drivetrainType}');
      print('Climbs: ${team.pitsScouting?.climbsInEndgame}');
      print('');
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