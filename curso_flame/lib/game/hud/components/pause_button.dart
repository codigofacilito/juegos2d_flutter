import 'package:curso_flame/game/menus/pause_menu.dart';
import 'package:curso_flame/game/my_game.dart';
import 'package:flutter/material.dart';

import '../hud.dart';

class PauseButton extends StatelessWidget{
  MyGame gameRef;
  PauseButton(this.gameRef);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
        onPressed: (){
          gameRef.overlays.remove(Hud.id);
          gameRef.overlays.add(PauseMenu.id);
        },
        icon: const Icon(Icons.pause_rounded,color: Colors.white,));
  }

}