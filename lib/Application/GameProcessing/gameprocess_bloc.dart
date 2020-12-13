import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:tic_tac_toe/Application/GameProcessing/game_data.dart';
import 'package:tic_tac_toe/Application/GameProcessing/gameprocess_event.dart';
import 'package:tic_tac_toe/Application/GameProcessing/gameprocess_state.dart';
import 'package:tic_tac_toe/Domain/GameProcessBlock/gameprocess_algorithm.dart';

class GameProcessBloc extends Bloc<GameProcessEvent,GameProcessStates>{
  GameProcessBloc() : super(null);
  static int _counter=0;
  static GameDataEntity gameDataEntity=GameDataEntity(col1: [null,null,null], col2:[null,null,null], col3:[null,null,null]);

  @override
  Stream<GameProcessStates> mapEventToState(GameProcessEvent event)async*{
    if(event is StartGameProcess){
      yield ProcessInit(gameDataEntity: gameDataEntity);
    }
    if(event is MakeMove){
      gameDataEntity=event.gameDataEntity;
      if(_counter%2==0){
        if(event.col==1){
          gameDataEntity.col1[event.row]=event.initialData.playerOne;
        }
        else if(event.col==2){
          gameDataEntity.col2[event.row]=event.initialData.playerOne;
        }
        else if(event.col==3){
          gameDataEntity.col3[event.row]=event.initialData.playerOne;
        }
        yield MakeMoveState(data:event.initialData.playerOne, gameDataEntity: gameDataEntity);
      }
      else {
        if(event.col==1){
          gameDataEntity.col1[event.row]=event.initialData.playerTwo;
        }
        else if(event.col==2){
          gameDataEntity.col2[event.row]=event.initialData.playerTwo;
        }
        else if(event.col==3){
          gameDataEntity.col3[event.row]=event.initialData.playerTwo;
        }
        yield MakeMoveState(data:event.initialData.playerTwo, gameDataEntity: gameDataEntity);
      }
    }
    else if(event is CheckWinner){
      _counter+=1;
      if(_counter>=5){
        print("Winner Check Started");
        var temp =await GameProcessAlgorithm.checkWinner(event.col1, event.col2, event.col3);
        print("Winner Check Complete");
        print("${temp.check},${temp.winner}");
        if(temp.check!=0){
          print("Winner Found");
          yield WinnerFound(winner:temp.winner, looser:!temp.winner);
          _counter=0;
          gameDataEntity=GameDataEntity(col1: [null,null,null], col2:[null,null,null], col3:[null,null,null]);
        }
      }
      if(_counter==9 && state is !WinnerFound){
        yield Draw();
        _counter=0;
        gameDataEntity=GameDataEntity(col1: [null,null,null], col2:[null,null,null], col3:[null,null,null]);
      }
    }
    else if(event is GiveUp){
      yield WinnerFound(winner:event.winner, looser: event.looser);
      _counter=0;
      gameDataEntity=GameDataEntity(col1: [null,null,null], col2:[null,null,null], col3:[null,null,null]);
    }
  }


}