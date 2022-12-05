import 'package:curso_flame/game/menus/pause_menu.dart';
import 'package:curso_flame/game/my_game.dart';
import 'package:curso_flame/provider/game_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../hud/hud.dart';
import 'components/buttom_menu.dart';
import 'components/menu_base.dart';

class GameOverMenu extends StatelessWidget{
  static const id = "GameOverMenu";
  MyGame gameRef;
  late GameProvider gameProvider;
  GameOverMenu(this.gameRef);
  @override
  Widget build(BuildContext context) {
    gameProvider= context.watch<GameProvider>();
    // TODO: implement build
    return MenuBase(
      title: Column(children: [
        const Text("Game over",
        style:  TextStyle(
          fontSize: 40,
          color: Colors.white
        ),),
        Text("Score: ${gameProvider.highScore}",
          style: const TextStyle(
              fontSize: 30,
              color: Colors.white
          ),)
      ]),
        buttons: [
      ButtonMenu("Reiniciar", Icons.play_arrow_rounded, (){
        gameRef.overlays.remove(GameOverMenu.id);
        gameRef.overlays.add(Hud.id);
        gameRef.reset();
        gameRef.startGame();
      }),
      ButtonMenu("Salir", Icons.settings_rounded, (){
        SystemNavigator.pop();
      })
    ]);
  }

}