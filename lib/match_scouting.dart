import 'dart:io';

import 'main.dart';

void runMatchScouting() {
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
          matchScout();
        case 2:
          viewMatchData();
        default:
          print('$parsedInput is not an option!');
      }
    } catch (e) {
      print('Enter a number!');
      continue;
    }
  }
}
void viewMatchData() {
  int teamNumber = askForInt('Enter the team number you want to view: ');

  for (Team team in teams) {
    if (team.teamNumber == teamNumber) {

      for (Match match in team.matches) {
        print('Match ${match.matchNumber}');
        print('Autonomous: ${match.autonomousScore}');
        print('Teleop: ${match.teleopScore}');
        print('Endgame: ${match.endgameScore}');
        print('Fouls: ${match.fouls}');

      }
    }
  }
}



void matchScout() {
  int teamNumber = askForInt('Enter the team number you want to scout: ');
  String teamName = askForString('Enter the team name: ');

  int matchNumber = askForInt('Enter the match number: ');
  int autonomousScore = askForInt('Enter the autonomous score: ');
  int teleopScore = askForInt('Enter the teleop score: ');
  int endgameScore = askForInt('Enter the endgame score: ');
  int fouls = askForInt('Enter the number of fouls: ');

  Match matchData = Match(
    matchNumber: matchNumber,
    autonomousScore: autonomousScore,
    teleopScore: teleopScore,
    endgameScore: endgameScore,
    fouls: fouls,
  );
  bool teamFound = false;
  for (Team team in teams) {
    if (team.teamNumber == teamNumber) {
      team.matches.add(matchData);
      teamFound = true;
    }
  }
  if (!teamFound) {
    teams.add(
      Team(
        teamNumber: teamNumber,
        teamName: teamName,
        matches : [matchData],
      ),
    );

    print('Added $teamName to registered teams');
  }
}