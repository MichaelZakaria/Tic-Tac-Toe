import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/common/fonts/my_fonts.dart';
import '../common/Images/my_image.dart';
import '../common/buttons/my_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ElasticIn(
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// Title
                Expanded(
                    child: Center(child: Text('Tic-Tac-Toe', style: MyFonts.myFontWhite.copyWith(fontSize: 28),))
                ),
                /// Image
                const MyImage(),
                /// Easy game button
                const MyButton(text: 'Easy', gameMode: 'easy',),
                const SizedBox(height: 10),
                /// Hard game button
                const MyButton(text: 'Hard', gameMode: 'hard',),
                const SizedBox(height: 10),
                /// 2P game button
                const MyButton(text: '2P', gameMode: '2p',),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



