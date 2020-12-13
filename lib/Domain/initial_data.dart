import 'package:flutter/cupertino.dart';

class InitialData{
  final bool playerOne;
  final bool playerTwo;

  //true is set for player with circle symbol
  //false is set for player with 'x' symbol

  const InitialData({
    @required this.playerOne,
    @required this.playerTwo,
  });
}