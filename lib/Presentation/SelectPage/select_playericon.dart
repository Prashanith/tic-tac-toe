import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/Application/GameInit_Bloc/Gameinitialization_bloc.dart';
import 'package:tic_tac_toe/Application/GameInit_Bloc/Gameinitialization_states.dart';
import 'package:tic_tac_toe/Domain/initial_data.dart';
import 'package:tic_tac_toe/Presentation/GameScreen/gamescreen.dart';

class PlayersIcons extends StatefulWidget {
  @override
  _PlayersIconsState createState() => _PlayersIconsState();
}

class _PlayersIconsState extends State<PlayersIcons> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameInitBloc,GameInitState>(
      buildWhen: (previousState, state) => state.runtimeType != previousState.runtimeType,
        builder:(context,state){
          if(state is StartGameInitializing){
            return SelectPlayerIcons(data:null);
          }
          if(state is GameIconsInitialized){
            return SelectPlayerIcons(data: state.initialData);
          }
          else if(state is StartGameState){
            return GameScreen(initialData: state.initialData);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
    });
  }
}


class SelectPlayerIcons extends StatefulWidget {
  final InitialData data;
  const SelectPlayerIcons({@required this.data});
  @override
  _SelectPlayerIconsState createState() => _SelectPlayerIconsState();
}

class _SelectPlayerIconsState extends State<SelectPlayerIcons> {
  final TextStyle chipStyle=const TextStyle(
    color: Colors.white,
    fontSize: 15,
  );

  static const String pathOne="assets/icon_one.png";
  //cross
  static const String pathTwo="assets/icon_two.png";
  //circle


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height/4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Chip(
                  label:Text(
                    "Player 1",
                    style: chipStyle,
                  ),
                  backgroundColor: Colors.green[900],
                ),
                Chip(
                  label:Text(
                    "Player 2",
                    style: chipStyle,
                  ),
                  backgroundColor: Colors.green[900],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TweenAnimationBuilder(
                    tween: Tween<double>(begin:0,end:28.27433),
                    duration: Duration(seconds: 2),
                    builder: (_,angle,__){
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.0) // perspective
                          ..rotateY(angle),
                        alignment: FractionalOffset.center,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height:130,
                          width:130,
                          decoration:ShapeDecoration(
                            color: Colors.green[900],
                            shape: RoundedRectangleBorder(
                                side:BorderSide.none,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          child: Image(
                            image: widget.data.playerOne?AssetImage("$pathTwo"):AssetImage("$pathOne"),
                          ),
                        ),
                      );
                    }
                ),
                Text('Vs',style:TextStyle(fontSize: 35),),
                TweenAnimationBuilder(
                    tween: Tween<double>(begin:0,end:28.27433),
                    duration: Duration(seconds: 2),
                    builder: (_,angle,__){
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.0) // perspective
                          ..rotateY(angle),
                        alignment: FractionalOffset.center,
                        child: Container(
                          padding: EdgeInsets.all(14),
                          height:130,
                          width:130,
                          decoration:ShapeDecoration(
                            color: Colors.green[900],
                            shape: RoundedRectangleBorder(
                                side:BorderSide.none,
                                borderRadius: BorderRadius.circular(10)
                            ),
                          ) ,
                          child: Image(
                            image:widget.data.playerTwo?AssetImage("$pathTwo"):AssetImage("$pathOne"),
                          ),
                        ),
                      );
                    }
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height/4,
            ),
          ],
        ),
      ),
    );
  }
}



