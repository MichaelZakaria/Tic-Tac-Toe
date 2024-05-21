import 'package:animate_do/animate_do.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../views/home_screen.dart';
import '../fonts/my_fonts.dart';
import '../score_board/my_score_board.dart';

class MyPauseButton extends StatelessWidget {
  const MyPauseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: GestureDetector(
        onTap: () {
          AudioPlayer().play(AssetSource('pause_sound.wav'));
          showDialog(
            barrierDismissible: true,
            context: context, builder: (BuildContext context) => SlideInRight(
            child: AlertDialog(
              alignment: Alignment.center,
              title: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Icon(Icons.pause, size: 50,),
                  )
              ),
              content: const MyScoreBoard(winner: ''),
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
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.play_arrow_outlined, color: Colors.white),
                        )
                    )
                  ],
                )
              ],
            ),
          ),
          );
        },

        child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.5),
                border: Border.all(color: Colors.white, width: 5)
            ),
            padding: const EdgeInsets.all(10),
            child: Text('||', style: MyFonts.myFontBlack.copyWith(fontSize: 12, color: Colors.black.withOpacity(0.6)),)
        ),
      ),
    );
  }
}
