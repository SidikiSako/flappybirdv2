import 'dart:ui';
import 'package:flame/assets.dart';
import 'package:flame/sprite.dart';
import 'package:flappybird_v2/flappy_game.dart';

class Background {
  final FlappyGame game;
  late final Sprite bgSprit;
  late final Rect bgRect;

  Background({required this.game}) {
    initComponent();
  }

  void initComponent() async {
    final Images imageLoader = Images();
    bgSprit = Sprite(await imageLoader.load('background-day.png'));
    bgRect = Rect.fromLTWH(0, 0, game.screenSize.x, game.screenSize.y);
  }

  void render(Canvas c) {
    bgSprit.renderRect(c, bgRect);
  }

  void update(double t) {}
}
