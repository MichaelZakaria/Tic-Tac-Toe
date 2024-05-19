import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/game_controller.dart';
import '../common/fonts/my_fonts.dart';

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
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Player O', style: MyFonts.myFontWhite),
                        const SizedBox(height: 8),
                        Obx(() => Text(controller.oScore.toString(), style: MyFonts.myFontWhite)),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Player X', style: MyFonts.myFontWhite),
                        const SizedBox(height: 8),
                        Obx(() => Text(controller.xScore.toString(), style: MyFonts.myFontWhite)),
                      ],
                    )
                  ],
                )
            ),

            /// Board
           Expanded(
                flex: 3,
                child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () { controller.onTap(index); },
                        child: Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.grey[700]!)),
                          child: Center(
                            child: Obx(() => Text(controller.displayXO[index], style: const TextStyle(color: Colors.white, fontSize: 30))),
                          ),
                        ),
                      );
                    }
                ),
              ),

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
