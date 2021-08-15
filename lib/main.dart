import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/Application/GameInit_Bloc/Gameinitialization_states.dart';
import 'package:tic_tac_toe/Application/GameProcessing/gameprocess_bloc.dart';
import 'package:tic_tac_toe/Application/GameProcessing/gameprocess_event.dart';
import 'package:tic_tac_toe/Presentation/GameScreen/gamescreen.dart';
import 'Application/GameInit_Bloc/GameInitialization_events.dart';
import 'Application/GameInit_Bloc/Gameinitialization_bloc.dart';
import 'Presentation/HomePage/home.dart';
import 'Presentation/SelectPage/select_playericon.dart';
import 'package:bloc/bloc.dart';
//main
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('${cubit.runtimeType} $error $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<GameInitBloc>(
        create: (context) => GameInitBloc()..add(StartHome()),
      ),
      BlocProvider<GameProcessBloc>(
        create: (context) => GameProcessBloc()..add(StartGameProcess()),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      color: Colors.white,
      home: Scaffold(
        body:
            BlocBuilder<GameInitBloc, GameInitState>(builder: (context, state) {
          if (state is GameLaunched) {
            return Home();
          } else if (state is StartGameInitializing ||
              state is GameIconsInitialized) {
            return PlayersIcons();
          } else if (state is StartGameState) {
            return GameScreen(
              initialData: state.initialData,
            );
          }
          return Home();
        }),
        backgroundColor: Colors.lightGreen[200],
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
