import 'package:curso_flame/game/enemy/enemies.dart';
import 'package:curso_flame/game/enemy/enemy.dart';
import 'package:curso_flame/game/menus/game_over_menu.dart';
import 'package:curso_flame/game/menus/main_menu.dart';
import 'package:curso_flame/game/menus/pause_menu.dart';
import 'package:curso_flame/game/player/player.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import '../provider/game_provider.dart';
import 'animation_map/animated_maps.dart';
import 'hud/hud.dart';
import 'lives/lives.dart';

class MyGame extends FlameGame with TapDetector, HasCollisionDetection{
  GameProvider gameProvider;

  MyGame(this.gameProvider);



  static const imageAssets = [
    "spritesheet.png",
    "enemies/ninja.png",
    "enemies/knight.png",
    "brain.png"
  ];
  late Player player;
  late Enemies enemies;
  late Lives lives;
  @override
  Future<void>? onLoad() async{
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play("music.mp3",volume: 30);
   await images.loadAll(imageAssets);
    final parallaxBackground = await loadParallaxComponent(
      [
        ParallaxImageData("parallax/1.png"),
        ParallaxImageData("parallax/2.png"),
        ParallaxImageData("parallax/3.png"),
        ParallaxImageData("parallax/4.png"),
        ParallaxImageData("parallax/5.png"),
        ParallaxImageData("parallax/6.png"),
        ParallaxImageData("parallax/7.png"),
        ParallaxImageData("parallax/8.png"),
        ParallaxImageData("parallax/9.png"),
      ],
      baseVelocity: Vector2(20,0),
      repeat: ImageRepeat.repeatX,
      velocityMultiplierDelta: Vector2(1.4,0)
    );
   add(parallaxBackground);
    // TODO: implement onLoad
    return super.onLoad();
  }

  startGame(){
    player = Player(images.fromCache("spritesheet.png"),animationMapPlayer);
    enemies = Enemies(images);
    lives = Lives(images.fromCache("brain.png"));

    add(player);
    add(enemies);
    add(lives);
  }

  removeComponents(){
    player.removeFromParent();
    enemies.removeAllEnemies();
    lives.removeAllLives();
  }
  reset(){
    removeComponents();
    gameProvider.currentScore = 0;
    gameProvider.life=5;
  }

  @override
  void update(double dt) {

    if(overlays.isActive(MainMenu.id) || overlays.isActive(PauseMenu.id)){
      pauseEngine();
    }

    if(gameProvider.life<=0){
      overlays.remove(Hud.id);
      overlays.add(GameOverMenu.id);
      gameProvider.saveHighScore();
      pauseEngine();
    }
    // TODO: implement update
    super.update(dt);
  }
@override
  void onTap() {
    player.jump();
    // TODO: implement onTap
    super.onTap();
  }

  @override
  void onMount() {

    // TODO: implement onMount
    super.onMount();
  }

  @override
  void onRemove() {

    // TODO: implement onRemove
    super.onRemove();
  }

  @override
  backgroundColor()=> Colors.grey;
}