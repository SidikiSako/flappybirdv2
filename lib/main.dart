import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flappybird_v2/flappy_game.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setPortraitUpOnly();
  final FlappyGame game = FlappyGame();
  runApp(
    GameWidget(game: game),
  );
}
