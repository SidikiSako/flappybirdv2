import 'dart:ui';

import 'package:flame/assets.dart';
import 'package:flame/sprite.dart';
import 'package:flappybird_v2/flappy_game.dart';

const double baseHeight = 150;

class Base {
  final FlappyGame game;
  late final Sprite baseSprite;
  Rect? baseRect;
  Base({required this.game}) {
    initBase();
  }

  void initBase() async {
    final Images imageLoader = Images();
    baseSprite = Sprite(await imageLoader.load('base.png'));
    baseRect = Rect.fromLTWH(
        0, game.screenSize.y - baseHeight, game.screenSize.x, baseHeight);
  }

  void update(double t) {
    baseRect = baseRect?.translate(-1, 0);
  }

  void render(Canvas c) {
    Rect? rect = baseRect;
    if (rect != null) {
      baseSprite.renderRect(c, rect);
    }
    //baseSprite.renderRect(c, baseRect!);
  }
}
