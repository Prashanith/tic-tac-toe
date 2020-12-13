import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/Application/GameInit_Bloc/GameInitialization_events.dart';
import 'package:tic_tac_toe/Application/GameInit_Bloc/Gameinitialization_bloc.dart';
import 'package:tic_tac_toe/Application/GameProcessing/gameprocess_bloc.dart';
import 'package:tic_tac_toe/Application/GameProcessing/gameprocess_event.dart';

class ResultScreen extends StatefulWidget {
  final bool winner;
  final bool looser;
  final bool draw;

  const ResultScreen({
    @required this.winner,
    @required this.looser,
    @required this.draw,
});

  @override
  _ResultScreenState createState() => _ResultScreenState(this.winner);
}

class _ResultScreenState extends State<ResultScreen> {
  _ResultScreenState(bool winner);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: SimpleDialog(
          backgroundColor: Colors.green[900],
          elevation: 10,
          contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
          titlePadding: EdgeInsets.all(20),
          title:widget.draw?
          Text("draw", textAlign: TextAlign.center,style:TextStyle(color: Colors.lightGreen[100],fontSize: 25,fontWeight: FontWeight.w400),):
          widget.winner?
          Text("NOUGHT WINS", textAlign: TextAlign.center,style: TextStyle(color: Colors.lightGreen[100],fontSize: 25,fontWeight: FontWeight.w400),):
          Text("CROSS WINS",textAlign: TextAlign.center,style:TextStyle(color: Colors.lightGreen[100],fontSize: 25,fontWeight: FontWeight.w400),),
          children: [
            TweenAnimationBuilder(
                tween: Tween<double>(begin:0.3,end:1),
                duration: Duration(milliseconds: 1000),
                builder: (_,angle,__){
                  return Transform.scale(
                    alignment: FractionalOffset.center,
                    scale: angle,
                    child:widget.draw?
                    Image(
                      image:AssetImage("assets/draw.png"),
                    ):(widget.winner?
                        Image(
                          height: MediaQuery.of(context).size.width/3,
                          width: MediaQuery.of(context).size.width/3,
                          image:AssetImage("assets/icon_two.png"),
                        ):
                        Image(
                          height: MediaQuery.of(context).size.width/3,
                          width: MediaQuery.of(context).size.width/3,
                          image:AssetImage("assets/icon_one.png"),
                        )
                    )
                  );
                }
            ),
            SizedBox(height:30,),
            RaisedButton(
              color: Colors.lightGreen[100],
              child: Text("PLAY AGAIN"),
              onPressed:(){
                BlocProvider.of<GameInitBloc>(context).add(StartGame());
                BlocProvider.of<GameProcessBloc>(context).add(StartGameProcess());
              }
            ),
          ],
        ),
      ),
    );
  }
}
