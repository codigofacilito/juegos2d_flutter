import 'dart:math';

import 'package:curso_flame/game/animation_map/animated_maps.dart';
import 'package:curso_flame/game/enemy/enemy.dart';
import 'package:curso_flame/game/my_game.dart';
import 'package:flame/cache.dart';
import 'package:flame/components.dart';

import '../../model/enemy_model.dart';

class Enemies extends Component with HasGameRef<MyGame>{

  Images images;

  List<EnemyModel>enemies = [];
  final Timer timer = Timer(3,repeat: true);

  Enemies(this.images){
    timer.onTick = randomEnemy;
  }

  @override
  void update(double dt) {
    timer.update(dt);
    // TODO: implement update
    super.update(dt);
  }
  @override
  void onMount() {

    if(enemies.isEmpty) {
      enemies = [
        EnemyModel(images.fromCache("enemies/knight.png"), animationMapKnight),
        EnemyModel(images.fromCache("enemies/ninja.png"), animationMapNinja),
      ];
    }

    timer.start();
    // TODO: implement onMount
    super.onMount();
  }


  randomEnemy(){
    final randomIndex = Random().nextInt(enemies.length);
    EnemyModel enemyModel = enemies.elementAt(randomIndex);
    Enemy enemy =Enemy(enemyModel.image, enemyModel.animationMap);

    enemy.anchor = Anchor.bottomRight;
    enemy.position = Vector2(gameRef.size.x+50, gameRef.size.y-(gameRef.size.y/12));
    enemy.size = Vector2.all(90);
    gameRef.add(enemy);
  }

  removeAllEnemies(){
    final enemies = gameRef.children.whereType<Enemy>();
    for(var enemy in enemies){
      enemy.removeFromParent();
    }
  }
}