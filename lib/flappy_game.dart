import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flappybird_v2/components/background.dart';
import 'package:flappybird_v2/components/base.dart';

class FlappyGame with Game {
  late final Vector2 screenSize;
  late final Background background;
  final List<Base> baseList = [];

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    screenSize = size;
  }

  @override
  Future<void>? onLoad() {
    background = Background(game: this);
    createBase();
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    background.render(canvas);
    for (Base base in baseList) {
      base.render(canvas);
    }
  }

  @override
  void update(double dt) {
    for (Base base in baseList) {
      base.update(dt);
    }
    baseList.removeWhere((Base base) => base.isVisible == false);
    if (baseList.length < 2) {
      createBase();
    }
  }

  void createBase() {
    baseList.clear();
    Base firstBase = Base(game: this, leftPosition: 0);
    Base secondBase = Base(game: this, leftPosition: screenSize.x);
    baseList.add(firstBase);
    baseList.add(secondBase);
  }
}
