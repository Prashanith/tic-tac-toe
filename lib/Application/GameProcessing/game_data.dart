

import 'package:flutter/cupertino.dart';

class GameDataEntity{
  List<bool> col1=List(3);
  List<bool> col2=List(3);
  List<bool> col3=List(3);

  GameDataEntity({
    @required this.col1,
    @required this.col2,
    @required this.col3
  });
}