import 'package:bloc/bloc.dart';
import 'package:tic_tac_toe/Domain/init_methods.dart';
import 'GameInitialization_events.dart';
import 'Gameinitialization_states.dart';


class GameInitBloc extends Bloc<GameInitEvent,GameInitState>{
  GameInitBloc() : super(null);

  @override
  Stream<GameInitState> mapEventToState(GameInitEvent event) async*{
    if(event is StartHome){
      yield GameLaunched();
    }
    else if(event is StartGame){
      yield StartGameInitializing();

      final initObject=InitMethods.initializeIcons();
      yield GameIconsInitialized(initialData:initObject);

      await Future.delayed(Duration(seconds: 3));
      yield StartGameState(initialData:initObject);
    }
  }
}