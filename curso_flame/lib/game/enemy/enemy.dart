import 'package:curso_flame/game/my_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

import '../../common/enums.dart';
import '../player/player.dart';

class Enemy extends SpriteAnimationGroupComponent with HasGameRef<MyGame>, CollisionCallbacks{
  Enemy(Image image,Map<EnemyStates,SpriteAnimationData>animationMap):super.fromFrameData(image, animationMap);

  bool isHit = false;
  Timer hitTimer = Timer(1);
  @override
  void onMount() {

    hitTimer.onTick = (){
      current = EnemyStates.run;
      isHit = false;
    };
    current = EnemyStates.run;

    add(RectangleHitbox());
    // TODO: implement onMount
    super.onMount();
  }
  @override
  void update(double dt) {
    x -= 200 * dt;

    if(x<=0){
      gameRef.gameProvider.currentScore +=1;
      removeFromParent();
    }

    hitTimer.update(dt);
    // TODO: implement update
    super.update(dt);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {

    if(other is Player && !isHit){
      current = EnemyStates.attack;
      isHit = true;
      hitTimer.start();
    }

    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
  }
}