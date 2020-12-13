import 'dart:math';

import 'package:tic_tac_toe/Domain/initial_data.dart';

class InitMethods{
  // initializeIcons
  static InitialData initializeIcons(){
    var randomBool = Random();
    bool p1=randomBool.nextBool();
    bool p2=!p1;
    return InitialData(playerOne: p1, playerTwo:p2);
  }
}