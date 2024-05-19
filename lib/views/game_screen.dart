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

    String turnText;
    int rotations;
    if(game == '2p') {
      turnText = 'Your Turn';
      rotations = 2;
    } else {
      turnText = 'Ai Turn';
      rotations = 0;
    }



    return Obx(
      () => Scaffold(
        backgroundColor: Colors.grey[900],
        body: Stack(
          children: [
            /// First Player Turn
            if(controller.oTurn.value)
              Positioned(
                top: -5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(500), bottomRight: Radius.circular(500)),
                    color: Colors.blue,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Center(
                    child:RotatedBox(
                        quarterTurns: rotations,
                        child: Text(turnText, style: MyFonts.myFontWhite)),
                  ),
                ),
              ),

            /// Board
           const MyBoard(),

            /// Second Player Turn
            if(!controller.oTurn.value)
              Positioned(
              bottom: -5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(500), topRight: Radius.circular(500)),
                  color: Colors.red,
                ),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Center(
                  child: Text('Your Turn', style: MyFonts.myFontWhite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}


