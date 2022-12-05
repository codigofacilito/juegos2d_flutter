import 'package:curso_flame/game/my_game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../hud/hud.dart';
import 'components/buttom_menu.dart';
import 'components/menu_base.dart';

class PauseMenu extends StatelessWidget{
  static const id = "PauseMenu";
  MyGame gameRef;
  PauseMenu(this.gameRef);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MenuBase(buttons: [
      ButtonMenu("Reanudar", Icons.play_arrow_rounded, (){
        showHud();
      }),
      ButtonMenu("Reiniciar", Icons.refresh_rounded, (){
        showHud();
        gameRef.reset();
        gameRef.startGame();
      }),
      ButtonMenu("Salir", Icons.exit_to_app_rounded, (){
        SystemNavigator.pop();
      })
    ]);
  }
  showHud(){
    gameRef.overlays.remove(PauseMenu.id);
    gameRef.overlays.add(Hud.id);
    gameRef.resumeEngine();
  }

}