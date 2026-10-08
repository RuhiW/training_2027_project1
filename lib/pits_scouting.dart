import 'dart:io';

import 'main.dart';

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
    print('#2 View teams');
    print('');
    stdout.write('Select option: ');

    try {
      String input = stdin.readLineSync() ?? '';
      int parsedInput = int.parse(input); // Convert string to int

      switch (parsedInput) {
        case 1:
          scoutPits();
        case 2:
          viewPitsData();
        default:
          print('$parsedInput is not an option!');
      }
    } catch (e) {
      print('Enter a number!');
      continue;
    }
  }
}


void viewPitsData() {
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
