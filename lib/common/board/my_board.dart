import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../controllers/game_controller.dart';
import 'board_borders.dart';

class MyBoard extends StatelessWidget {
  const MyBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = GameController.instance;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Obx(
        () => AbsorbPointer(
          absorbing: controller.disableTap.value,
          child: Center(
            child: GridView.builder(
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () { controller.onTap(index); },
                    child: Container(
                      decoration: BoxDecoration(border: borders[index]),
                      child: Center(
                        child: Obx(() => Pulse(
                            infinite: controller.isAnimatingCell[index],
                            animate: controller.isAnimatingCell[index],
                            child: Text(controller.displayXO[index], style: const TextStyle(color: Colors.white, fontSize: 35))
                        )),
                      ),
                    ),
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}
