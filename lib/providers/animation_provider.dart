import 'package:flutter/material.dart';

class AnimationProvider with ChangeNotifier {
  bool _play = false;
  bool get play => _play;

  void toggleAnimation() {
    _play = !_play;
    notifyListeners();
  }
}
