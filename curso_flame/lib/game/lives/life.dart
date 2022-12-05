import 'package:curso_flame/game/my_game.dart';
import 'package:curso_flame/game/player/player.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

class Life extends SpriteComponent with HasGameRef<MyGame>,CollisionCallbacks{
  Life(Image image):super.fromImage(image);

  @override
  void onMount() {
    anchor = Anchor.bottomRight;
    position = Vector2(gameRef.size.x-100,  gameRef.size.y-(gameRef.size.y/12));
    size = Vector2.all(50);

    add(RectangleHitbox());
    // TODO: implement onMount
    super.onMount();
  }
  @override
  void update(double dt) {
    x -= 130 * dt;

    // TODO: implement update
    super.update(dt);
  }
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {

    if(other is Player){
      gameRef.gameProvider.life+=1;
      removeFromParent();
    }
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
  }
}