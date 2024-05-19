import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  const MyImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: AvatarGlow(
          glowRadiusFactor: 0.4,
          duration: const Duration(seconds: 2),
          glowColor: Colors.white,
          repeat: true,
          startDelay: const Duration(seconds: 1),
          child: Container(
            decoration: BoxDecoration(border: Border.all(style: BorderStyle.none), shape: BoxShape.circle),
            child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.grey[900],
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset('assets/tic-tac-toe_39453.png', color: Colors.white, fit: BoxFit.scaleDown, )),
            ),
          ),
        )
    );
  }
}