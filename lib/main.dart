import 'dart:math';

class Team {
  int teamNumber;
  String teamName;
  PitsScouting pitsScouting;
  List<Match> matches;


  Team({
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



