import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/game_controller.dart';
import '../common/board/my_board.dart';
import '../common/fonts/my_fonts.dart';
import '../common/score_board/my_score_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key, required this.game});

  final String game;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GameController(game: game));

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            /// Score
            const MyScoreBoard(),

            /// Board
           const MyBoard(),

            /// Title
            Expanded(
                child: Center(
                  child: Text('Tic-Tac-Toe', style: MyFonts.myFontWhite),
                )
            ),
          ],
        ),
      ),
    );
  }


}


