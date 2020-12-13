
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'game_data.dart';

abstract class GameProcessStates extends Equatable{
  const GameProcessStates();
}

class ProcessInit extends GameProcessStates{
  final GameDataEntity gameDataEntity;
  ProcessInit({@required this.gameDataEntity});

  @override
  List<Object> get props => [gameDataEntity];
}

class MakeMoveState extends GameProcessStates{
  final GameDataEntity gameDataEntity;
  final bool data;
  const MakeMoveState({@required this.data,@required this.gameDataEntity});
  @override
  List<Object> get props => [data,gameDataEntity];
}

class WinnerFound extends GameProcessStates{
  final bool winner;
  final bool looser;
  WinnerFound({@required this.winner,@required this.looser});

  @override
  List<Object> get props => [];
}

class Draw extends GameProcessStates{
  @override
  List<Object> get props => [];
}





