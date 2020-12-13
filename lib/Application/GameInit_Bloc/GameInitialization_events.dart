

import 'package:equatable/equatable.dart';


abstract class GameInitEvent extends Equatable{
  const GameInitEvent();
}

class StartHome extends GameInitEvent{
  @override
  List<Object> get props => [];

  @override
  bool get stringify =>true;
}

class StartGame extends GameInitEvent{
  @override
  List<Object> get props => [];

  @override
  bool get stringify =>true;
}
