import 'package:curso_flame/provider/game_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreHud extends StatelessWidget{
  late GameProvider gameProvider;
  @override
  Widget build(BuildContext context) {
    gameProvider = context.watch<GameProvider>();
    // TODO: implement build
   return Column(
     mainAxisSize: MainAxisSize.min,
     children: [
       Text("Score: ${gameProvider.currentScore}",
       style:const  TextStyle(fontSize: 30,color: Colors.white),),
       Text("High: ${gameProvider.highScore}",
         style: const TextStyle(fontSize: 20,color: Colors.white),)
     ],
   );
  }

}