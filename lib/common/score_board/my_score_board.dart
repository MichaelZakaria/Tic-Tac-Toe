import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../controllers/game_controller.dart';
import '../fonts/my_fonts.dart';

class MyScoreBoard extends StatelessWidget {
  const MyScoreBoard({
    super.key, required this.winner,
  });
  
  final String winner;

  @override
  Widget build(BuildContext context) {
    final controller = GameController.instance;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Player x', style: MyFonts.myFontBlack.copyWith(fontSize: 10, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Obx(() => Pulse(
                    animate: winner == 'x',
                    child: Text(controller.xScore.toString(), style: MyFonts.myFontBlack.copyWith(fontSize: 18))
                )),
              ],
            ),
          ),

          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Player o', style: MyFonts.myFontBlack.copyWith(fontSize: 10, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Obx(() => Pulse(
                    animate: winner == 'o',
                    child: Text(controller.oScore.toString(), style: MyFonts.myFontBlack.copyWith(fontSize: 18))
                )),
              ],
            ),
          )
        ],
      );
  }
}