import 'package:flutter/foundation.dart';

class GameProcessAlgorithm{
  static Future<Result> checkWinner(List<bool> colA,List<bool> colB,List<bool> colC){
    //primary column check
    if(colA[0]!=null){
      if(colA[0]==colA[1]){
        if(colA[1]==colA[2]){
          return Future.value(Result(winner: colA[0], check: 1));
        }
      }
    }
    if(colB[0]!=null){
     if(colB[0]==colB[1]){
      if(colB[1]==colB[2]){
        return Future.value(Result(winner: colB[0], check: 1));
      }
     }
    }

    if(colC[0]!=null){
      if(colC[0]==colC[1]){
        if(colC[1]==colC[2]){
          return Future.value(Result(winner: colC[0], check: 1));
        }
      }
    }


    // row check
    if(colA[0]!=null){
      if(colA[0]==colB[0]){
        if(colB[0]==colC[0]){
          return Future.value(Result(winner: colC[0], check: 1));
        }
      }
    }
    if(colA[1]!=null){
      if(colA[1]==colB[1]){
        if(colB[1]==colC[1]){
          return Future.value(Result(winner: colC[1], check: 1));
        }
      }
    }

    if(colA[2]!=null){
      if(colA[2]==colB[2]){
        if(colB[2]==colC[2]){
          return Future.value(Result(winner: colC[2], check: 1));
        }
      }
    }


    //diagonal check
    if(colA[0]!=null){
      if(colA[0]==colB[1]){
        if(colB[1]==colC[2]){
          return Future.value(Result(winner:colC[2], check: 1));
        }
      }
    }

    if(colA[2]!=null){
      if(colA[2]==colB[1]){
        if(colB[1]==colC[0]){
          return Future.value(Result(winner:colC[0], check: 1));
        }
      }
    }
    return Future.value(Result(winner:true, check: 0));
  }
}

class Result{
  final bool winner;
  final int check;
  Result({
    @required this.winner,
    @required this.check,
  });
}