import 'dart:ui';

import 'package:flame/assets.dart';
import 'package:flame/sprite.dart';
import 'package:flappybird_v2/flappy_game.dart';

const double baseMovement = -130;

class Base {
  final FlappyGame game;
  late final Sprite baseSprite;
  Rect? baseRect;
  final double leftPosition;
  bool isVisible = true;

  Base({required this.game, required this.leftPosition}) {
    initBase();
  }

  void initBase() async {
    final Images imageLoader = Images();
    baseSprite = Sprite(await imageLoader.load('base.png'));
    baseRect = Rect.fromLTWH(
        leftPosition,
        game.screenSize.y - (game.screenSize.y / 8),
        game.screenSize.x,
        game.screenSize.y / 8);
  }

  void update(double t) {
    Rect? rect = baseRect;
    if (rect != null) {
      baseRect = rect.translate(baseMovement * t, 0);
      if (rect.right <= 0) {
        isVisible = false;
      }
    }
    //baseRect = baseRect?.translate(-2, 0);
  }

  void render(Canvas c) {
    Rect? rect = baseRect;
    if (rect != null) {
      baseSprite.renderRect(c, rect);
    }
    //baseSprite.renderRect(c, baseRect!);
  }
}
