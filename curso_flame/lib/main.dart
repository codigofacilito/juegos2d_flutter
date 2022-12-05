import 'package:curso_flame/game/hud/hud.dart';
import 'package:curso_flame/game/my_game.dart';
import 'package:curso_flame/provider/game_provider.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game/menus/game_over_menu.dart';
import 'game/menus/main_menu.dart';
import 'game/menus/pause_menu.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>GameProvider())
  ],
  child: GameZombie(),));
}

class GameZombie extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    GameProvider gameProvider = context.read<GameProvider>();
    // TODO: implement build
   return GameWidget(
     game: MyGame(gameProvider),
     loadingBuilder: (context) => const Center(
       child: SizedBox(
         width: 200,
         child: LinearProgressIndicator(
           color: Colors.pink,
           backgroundColor: Colors.black,
         ),
       ),
     ),
     overlayBuilderMap: {
       MainMenu.id:(_,MyGame gameRef)=>MainMenu(gameRef),
       PauseMenu.id:(_,MyGame gameRef)=>PauseMenu(gameRef),
       GameOverMenu.id:(_,MyGame gameRef)=>GameOverMenu(gameRef),
       Hud.id:(_,MyGame gameRef)=>Hud(gameRef),
     },
     initialActiveOverlays: [
       MainMenu.id
     ],
   );
  }

}

