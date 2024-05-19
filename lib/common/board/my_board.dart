import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../controllers/game_controller.dart';

class MyBoard extends StatelessWidget {
  const MyBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = GameController.instance;

    return Expanded(
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
    );
  }
}