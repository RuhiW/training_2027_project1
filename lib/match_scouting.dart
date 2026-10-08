import 'dart:io';

import 'package:training_2027_project1/models.dart';

import 'input_helpers.dart';


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


void matchScout() {
  int teamNumber = askForInt('Enter the team number you want to scout: ');
  String teamName = askForString('Enter the team name: ');

  int matchNumber = askForInt('Enter the match number: ');
  int autonomousScore = askForInt('Enter the autonomous score: ');
  int teleopScore = askForInt('Enter the teleop score: ');
  int endgameScore = askForInt('Enter the endgame score: ');
  int fouls = askForInt('Enter the number of fouls: ');

  MatchScouting matchData = MatchScouting(
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

void viewMatchData() {
  int teamNumber = askForInt('Enter the team number you want to view: ');



  for (Team team in teams) {
    if (team.teamNumber == teamNumber) {
      int totalFouls = 0;
      int totalPoints = 0;

      for (MatchScouting match in team.matches) {
        totalFouls += match.fouls;
        totalPoints +=
            match.autonomousScore + match.teleopScore + match.endgameScore;

        print('Match ${match.matchNumber}');
        print('Autonomous score: ${match.autonomousScore}');
        print('Teleop score: ${match.teleopScore}');
        print('Endgame score: ${match.endgameScore}');
        print('Fouls: ${match.fouls}');
        print('Total score: ${match.autonomousScore + match.teleopScore +
            match.endgameScore}');
      }
        print('Total number of fouls: $totalFouls');
        double average = totalPoints / team.matches.length;
        print('Average score: $average');
      }
  }
}