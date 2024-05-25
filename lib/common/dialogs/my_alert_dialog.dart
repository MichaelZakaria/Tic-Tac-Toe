import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controllers/game_controller.dart';
import 'package:tic_tac_toe/views/home_screen.dart';
import '../fonts/my_fonts.dart';
import '../score_board/my_score_board.dart';

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({
    super.key, required this.winner,
  });

  final String winner;

  @override
  Widget build(BuildContext context) {
    final controller = GameController.instance;

    return PopScope(
      canPop: false,
      child: BounceInDown(
        child: AlertDialog(
          alignment: Alignment.topCenter,
          title: Center(
              child: Text(
              winner != 'tie' ? 'Winner: $winner' : '- Draw -',
              style: MyFonts.myFontBlack.copyWith(overflow: TextOverflow.visible)
          )),
          content: MyScoreBoard(winner: winner),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(0.2),
                        elevation: 2,
                      ),
                      onPressed: () {
                        AudioPlayer().play(AssetSource('end_game_sound.wav'));
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                            (route) => false
                        );
                        Get.deleteAll();
                      },
                      child: Text('Main menu', style: MyFonts.myFontWhite.copyWith(fontSize: 10),),
                    )
                ),
        
                Flexible(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.2),
                      elevation: 2,
                    ),
                    onPressed: () {
                      AudioPlayer().play(AssetSource('home_button_sound_2.wav'));
                      controller.resetBoard();
                      Navigator.of(context).pop();
                      controller.isEndGame.value = false;
                      controller.disableTap.value = false;
                      controller.nextTurn();
                      controller.isTurnVisible.value = true;
                    },
                    child: Text('Again', style: MyFonts.myFontWhite.copyWith(fontSize: 10),),
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}