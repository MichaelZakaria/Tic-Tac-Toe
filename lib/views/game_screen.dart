import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/game_controller.dart';
import '../common/board/my_board.dart';
import '../common/fonts/my_fonts.dart';
import '../common/turn_indecators/x_turn.dart';
import '../common/turn_indecators/y_turn.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key, required this.game});

  final String game;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GameController(game: game));

    return Obx(
      () => Scaffold(
        backgroundColor: Colors.grey[900],
        body: Stack(
          children: [
            /// First Player Turn
            if(controller.oTurn.value && controller.isTurnVisible.value)
              Positioned(
                top: -5,
                child: XTurn(game: game,),
              ),

            /// Board
           const MyBoard(),

            /// Second Player Turn
            if(!controller.oTurn.value && controller.isTurnVisible.value)
              const Positioned(
              bottom: -5,
              child: YTurn(),
            ),
          ],
        ),
      ),
    );
  }

}
