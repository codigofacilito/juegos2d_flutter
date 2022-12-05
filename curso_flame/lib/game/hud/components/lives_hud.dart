import 'package:curso_flame/provider/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LivesHud extends StatelessWidget{
  late GameProvider gameProvider;
  @override
  Widget build(BuildContext context) {
    gameProvider = context.watch<GameProvider>();
    // TODO: implement build
    return Row(children: List.generate(5, (index) => Padding(padding: const EdgeInsets.symmetric(horizontal: 5),
    child: (index<gameProvider.life)?
      Image.asset("assets/images/brain_full.png",
      height: 35,
      width: 35,):
    Image.asset("assets/images/brain_outline.png",
      height: 35,
      width: 35,
    color: Colors.white,)
    )),);
  }

}