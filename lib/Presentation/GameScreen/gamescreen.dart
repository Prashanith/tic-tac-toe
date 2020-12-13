import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/Application/GameProcessing/game_data.dart';
import 'package:tic_tac_toe/Application/GameProcessing/gameprocess_bloc.dart';
import 'package:tic_tac_toe/Application/GameProcessing/gameprocess_event.dart';
import 'package:tic_tac_toe/Application/GameProcessing/gameprocess_state.dart';
import 'package:tic_tac_toe/Domain/initial_data.dart';
import 'package:tic_tac_toe/Presentation/GameScreen/resultscreen.dart';


class GameScreen extends StatefulWidget {
  final InitialData initialData;

  const GameScreen({Key key, this.initialData}) : super(key: key);
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static const String pathOne="assets/icon_one.png";
  //cross
  static const String pathTwo="assets/icon_two.png";
  //circle
  static const String pathEmpty="assets/tic-tac-toe-empty.png";

  final TextStyle chipStyle=const TextStyle(
    color: Colors.white,
    fontSize: 15,
  );

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameProcessBloc,GameProcessStates>(
        builder: (context,state){
        if(state is WinnerFound){
          return ResultScreen(winner: state.winner, looser: state.looser, draw: false);
        }
        if(state is Draw){
          return ResultScreen(winner: null, looser: null, draw:true);
        }
        if(state is ProcessInit){
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Chip(
                          label:Text(
                            "GiveUp(1)",
                            style: chipStyle,
                          ),
                          backgroundColor: Colors.green[900],
                        ),
                      ),
                      GestureDetector(
                        child: Chip(
                          label:Text(
                            "GiveUp(2)",
                            style: chipStyle,
                          ),
                          backgroundColor: Colors.green[900],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Table(
                      border: TableBorder.symmetric(
                          inside: BorderSide(
                              color: Colors.green[800],
                              width: 4,
                              style: BorderStyle.solid
                          ),
                          outside: BorderSide.none
                      ),
                      children: [
                        TableRow(
                            children: [
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 1,
                                          row: 0,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:(state is MakeMoveState)&&(state.gameDataEntity.col1[0]!=null)?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col1[0]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 1,
                                          row: 1,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col1[1]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col1[1]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 1,
                                          row: 2,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col1[2]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col1[2]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 2,
                                          row: 0,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col2[0]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col2[0]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 2,
                                          row: 1,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col2[1]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col2[1]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 2,
                                          row: 2,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col2[2]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col2[2]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 3,
                                          row: 0,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col3[0]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col3[0]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 3,
                                          row: 1,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col3[1]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col3[1]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 3,
                                          row: 2,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col3[2]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col3[2]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ],
                    ),
                  ),
                ],
              )
          );
        }
        if(state is MakeMoveState){
          return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        child: Chip(
                          label:Text(
                            "GiveUp(1)",
                            style: chipStyle,
                          ),
                          backgroundColor: Colors.green[900],
                        ),
                      ),
                      GestureDetector(
                        child: Chip(
                          label:Text(
                            "GiveUp(2)",
                            style: chipStyle,
                          ),
                          backgroundColor: Colors.green[900],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Table(
                      border: TableBorder.symmetric(
                          inside: BorderSide(
                              color: Colors.green[800],
                              width: 4,
                              style: BorderStyle.solid
                          ),
                          outside: BorderSide.none
                      ),
                      children: [
                        TableRow(
                            children: [
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 1,
                                          row: 0,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:(state is MakeMoveState)&&(state.gameDataEntity.col1[0]!=null)?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col1[0]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 1,
                                          row: 1,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col1[1]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col1[1]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 1,
                                          row: 2,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col1[2]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col1[2]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 2,
                                          row: 0,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col2[0]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col2[0]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 2,
                                          row: 1,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col2[1]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col2[1]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 2,
                                          row: 2,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col2[2]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col2[2]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),
                        TableRow(
                            children: [
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 3,
                                          row: 0,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col3[0]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col3[0]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 3,
                                          row: 1,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col3[1]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col3[1]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child:GestureDetector(
                                  onTap:(){
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        MakeMove(
                                          initialData:widget.initialData,
                                          gameDataEntity:GameDataEntity(
                                            col1:state.gameDataEntity.col1,
                                            col2:state.gameDataEntity.col2,
                                            col3:state.gameDataEntity.col3,
                                          ),
                                          col: 3,
                                          row: 2,
                                        ));
                                    BlocProvider.of<GameProcessBloc>(context).add(
                                        CheckWinner(
                                          col1:state.gameDataEntity.col1,
                                          col2:state.gameDataEntity.col2,
                                          col3:state.gameDataEntity.col3,
                                        )
                                    );
                                  },
                                  child:Container(
                                    alignment:AlignmentDirectional.center,
                                    padding:EdgeInsets.all(15),
                                    child:state is MakeMoveState&&state.gameDataEntity.col3[2]!=null?
                                    Image(
                                      image:AssetImage(state.gameDataEntity.col3[2]?pathTwo:pathOne),
                                    ):Opacity(
                                      opacity: 0.3,
                                      child: Image(
                                        image: AssetImage(pathEmpty),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ],
                    ),
                  ),
                ],
              )
          );
        }
        return Container();

    });
  }
}

