import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../fonts/my_fonts.dart';

class XTurn extends StatelessWidget {
  const XTurn({
    super.key, required this.game,
  });

  final String game;

  @override
  Widget build(BuildContext context) {
    String turnText;
    int rotations;
    if(game == '2p') {
      turnText = 'Your Turn';
      rotations = 2;
    } else {
      turnText = 'Ai Turn';
      rotations = 0;
    }

    return SlideInDown(
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
    );
  }
}