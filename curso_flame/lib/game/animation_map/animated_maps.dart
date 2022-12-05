import 'package:curso_flame/common/enums.dart';
import 'package:flame/components.dart';


double get endXRun =>(521*10);
double get endXCrash =>(endXRun + (521*8));
get animationMapPlayer =>{
  AnimationStates.run:SpriteAnimationData.sequenced(
      amount: 10,
      stepTime: 0.1,
      textureSize: Vector2(521,576)),
  AnimationStates.crash:SpriteAnimationData.sequenced(
      amount: 8,
      stepTime: 0.1,
      textureSize: Vector2(521,576),
      texturePosition: Vector2(endXRun,0)),
  AnimationStates.jump:SpriteAnimationData.sequenced(
      amount: 1,
      stepTime: 0.1,
      textureSize: Vector2(521,627),
      texturePosition: Vector2(endXCrash,0)),
};

double get endXAttackKnight =>(587*10);
get animationMapKnight =>{
  EnemyStates.attack:SpriteAnimationData.sequenced(
      amount: 10,
      stepTime: 0.1,
      textureSize: Vector2(587,707)),
  EnemyStates.run:SpriteAnimationData.sequenced(
      amount: 10,
      stepTime: 0.1,
      textureSize: Vector2(587,707),
      texturePosition: Vector2(endXAttackKnight,0)),
};



double get endXAttackNinja =>(383*9);
get animationMapNinja =>{
  EnemyStates.attack:SpriteAnimationData.sequenced(
      amount: 9,
      stepTime: 0.1,
      textureSize: Vector2(383,514)),
  EnemyStates.run:SpriteAnimationData.sequenced(
      amount: 10,
      stepTime: 0.1,
      textureSize: Vector2(376,520),
      texturePosition: Vector2(endXAttackNinja,0)),
};