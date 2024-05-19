import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/common/fonts/my_fonts.dart';
import 'package:tic_tac_toe/views/game_screen.dart';
import '../../controllers/game_controller.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text, required this.gameMode,
  });

  final String text;
  final String gameMode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => GameScreen(game: gameMode)))
        .then((value) => Get.delete<GameController>());
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(30),
          color: Colors.white,
          child: Center(
            child: Text(text, style: MyFonts.myFontBlack),
          ),
        ),
      ),
    );
  }
}