import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flappybird_v2/components/background.dart';
import 'package:flappybird_v2/components/base.dart';

class FlappyGame with Game {
  late final Vector2 screenSize;
  late final Background background;
  late final Base base;

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    screenSize = size;
  }

  @override
  Future<void>? onLoad() {
    background = Background(game: this);
    base = Base(game: this);
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);
    base.render(canvas);
  }

  @override
  void update(double dt) {
    base.update(dt);
  }
}
