
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:tic_tac_toe/Domain/initial_data.dart';

abstract class GameInitState extends Equatable{
  const GameInitState();
  @override
  List<Object> get props => [];
}

class GameLaunched extends GameInitState{
  const GameLaunched();
}

class StartGameInitializing  extends GameInitState{
  const StartGameInitializing();
  @override
  bool get stringify =>true;
}

class GameIconsInitialized extends GameInitState{
  final InitialData initialData;

  const GameIconsInitialized({
    @required this.initialData
  });

  @override
  List<Object> get props => [initialData];
}

class StartGameState extends GameInitState{
  final InitialData initialData;

  const StartGameState({
    @required this.initialData
  });
}
