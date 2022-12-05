import 'package:curso_flame/common/enums.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

class EnemyModel{
  Image image;
  Map<EnemyStates,SpriteAnimationData> animationMap;
  EnemyModel(this.image,this.animationMap);
}