import 'package:curso_flame/game/lives/life.dart';
import 'package:curso_flame/game/my_game.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

class Lives extends Component with HasGameRef<MyGame>{
  Image image;
  Timer timer = Timer(5,repeat: true);
  Lives(this.image){
    timer.onTick =lives;
  }

  lives(){
    Life life = Life(image);
    gameRef.add(life);
  }

  @override
  void onMount() {
    timer.start();
    // TODO: implement onMount
    super.onMount();
  }
  @override
  void update(double dt) {
    timer.update(dt);
    // TODO: implement update
    super.update(dt);
  }


  removeAllLives() {
    final lives = gameRef.children.whereType<Life>();
    for (var life in lives) {
      life.removeFromParent();
    }
  }
}