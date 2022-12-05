import 'package:curso_flame/game/my_game.dart';
import 'package:flutter/material.dart';

import 'components/lives_hud.dart';
import 'components/pause_button.dart';
import 'components/score_hud.dart';

class Hud extends StatelessWidget{
  static const id ="Hud";
  MyGame gameRef;
  Hud(this.gameRef);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      color: Colors.black.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          ScoreHud(),
          PauseButton(gameRef),
          LivesHud(),
        ],),
      ),
    );
  }

}