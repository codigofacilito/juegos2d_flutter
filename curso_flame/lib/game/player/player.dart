import 'package:curso_flame/game/my_game.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_audio/flame_audio.dart';

import '../../common/enums.dart';
import '../enemy/enemy.dart';

class Player extends SpriteAnimationGroupComponent<AnimationStates> with HasGameRef<MyGame> , CollisionCallbacks{
  Player(Image image,Map<AnimationStates,SpriteAnimationData>animationMap):super.fromFrameData(image, animationMap);

  double positionX = 0.0;
  double positionY = 0.0;

  double speedY = 0.0;

  bool isHit = false;
  Timer hitTimer = Timer(1);
  @override
  void onMount() {


    current = AnimationStates.run;
    anchor = Anchor.bottomLeft;
    positionX = 32;
    positionY =gameRef.size.y-(gameRef.size.y/12);
    position = Vector2(positionX, positionY);
    size = Vector2.all(120);
    add(RectangleHitbox());

    hitTimer.onTick=(){
      current = AnimationStates.run;
      isHit= false;
    };
    // TODO: implement onMount
    super.onMount();
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if((other is Enemy) && (!isHit)) {
      hit();
    }
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
  }

  hit(){
    isHit = true;
    current = AnimationStates.crash;
    hitTimer.start();
    gameRef.gameProvider.life -=1;
  }

  @override
  void update(double dt) {
    y -= speedY;
    speedY= speedY-1;

    if(isOnGround){
      y =positionY;
      speedY=0;
      if(current != AnimationStates.run && current !=AnimationStates.crash){
        current = AnimationStates.run;
      }
    }

    hitTimer.update(dt);
    // TODO: implement update
    super.update(dt);
  }

  jump(){
    FlameAudio.play("jump.mp3");
    if(isOnGround){
      speedY = 20;
      current = AnimationStates.jump;
    }
  }

  bool get isOnGround => (y>= positionY);
}