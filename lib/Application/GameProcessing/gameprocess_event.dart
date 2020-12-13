
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:tic_tac_toe/Domain/initial_data.dart';

import 'game_data.dart';

abstract class GameProcessEvent extends Equatable{
  const GameProcessEvent();
}

class StartGameProcess extends GameProcessEvent{
  @override
  List<Object> get props => [];
}

class MakeMove extends GameProcessEvent{
  final InitialData initialData;
  final GameDataEntity gameDataEntity;
  final int col;
  final int row;

  MakeMove({
    @required this.initialData,
    @required this.gameDataEntity,
    @required this.col,
    @required this.row,
  });

  @override
  List<Object> get props => [];

}

class CheckWinner extends GameProcessEvent{
  List<bool> col1=List(3);
  List<bool> col2=List(3);
  List<bool> col3= List(3);
  CheckWinner({
    @required this.col1,
    @required this.col2,
    @required this.col3,
  });
  @override
  List<Object> get props => [];
}

class GiveUp extends GameProcessEvent{
  final bool winner;
  final bool looser;

  GiveUp({@required this.winner,@required this.looser});
  @override
  List<Object> get props => [];
}
