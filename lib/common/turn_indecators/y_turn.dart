import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../fonts/my_fonts.dart';

class YTurn extends StatelessWidget {
  const YTurn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlideInUp(
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
    );
  }
}