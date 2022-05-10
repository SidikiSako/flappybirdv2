import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flappybird_v2/components/background.dart';

class FlappyGame with Game {
  late final Vector2 screenSize;
  late final Background background;

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    screenSize = size;
  }

  @override
  Future<void>? onLoad() {
    background = Background(game: this);
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);
  }

  @override
  void update(double dt) {
    // TODO: implement update
  }
}
