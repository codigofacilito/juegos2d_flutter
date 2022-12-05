import 'package:flutter/cupertino.dart';

class GameProvider extends ChangeNotifier{
  int _life = 5;
  int _currentScore = 0;
  int _highScore = 0;

  int get life => _life;
  int get currentScore => _currentScore;
  int get highScore => _highScore;

  set life(int life){
    if(life<=5 && life>=0){
      _life = life;
    }
    notifyListeners();
  }

  set currentScore(int score){
    _currentScore = score;
    notifyListeners();
  }

  saveHighScore(){
    if(_currentScore > _highScore){
      _highScore = _currentScore;
    }
    notifyListeners();
  }

}