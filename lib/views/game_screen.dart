import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/game_controller.dart';
import '../common/board/my_board.dart';
import '../common/fonts/my_fonts.dart';

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
            if(controller.oTurn.value && controller.isTurnVisible.value)
              Positioned(
                top: -5,
                child: SlideInDown(
                  duration: const Duration(milliseconds: 500),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(turnText, style: MyFonts.myFontWhite),
                              const SizedBox(height: 18),
                              Text('O', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.6))),
                            ],
                          )
                      ),
                    ),
                  ),
                ),
              ),

            /// Board
           const MyBoard(),

            /// Second Player Turn
            if(!controller.oTurn.value && controller.isTurnVisible.value)
              Positioned(
              bottom: -5,
              child: SlideInUp(
                duration: const Duration(milliseconds: 500),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(500), topRight: Radius.circular(500)),
                    color: Colors.red,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Your Turn', style: MyFonts.myFontWhite),
                        const SizedBox(height: 18),
                        Text('X', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.6))),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}


