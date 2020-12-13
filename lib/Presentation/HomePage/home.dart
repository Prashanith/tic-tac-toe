import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/Application/GameInit_Bloc/GameInitialization_events.dart';
import 'package:tic_tac_toe/Application/GameInit_Bloc/Gameinitialization_bloc.dart';
import 'package:tic_tac_toe/Application/GameInit_Bloc/Gameinitialization_states.dart';


class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> with TickerProviderStateMixin{
  AnimationController _controller;
  Animation<double> _animation;
  static final textStyle= TextStyle(
    wordSpacing:4,
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCirc,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.loose,
        children: [
          ScaleTransition(
            scale: _animation,
            child: Opacity(
              opacity:0.4,
              child: Image(
                width: MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.width ,
                image: AssetImage('assets/homepage_background.png'),
              ),
            ),
          ),
          BlocBuilder<GameInitBloc,GameInitState>(
              builder:(context,state){
                return OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(
                          color: Colors.green[900],
                          width: 2,
                        )
                    ),
                    padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(40,20,40,20)),
                    foregroundColor:MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.lightGreen[100];
                        return Colors.green[900]; // Use the component's default.
                      },
                    ),
                    backgroundColor:MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.green[900];
                        return Color(0x00000000); // Use the component's default.
                      },
                    ),
                  ),

                  onPressed: () {
                    BlocProvider.of<GameInitBloc>(context).add(StartGame());
                  },
                  child: Text(
                    'PLAY',
                    style:textStyle,
                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}


