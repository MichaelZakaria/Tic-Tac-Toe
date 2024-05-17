import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  static var myFontBlack = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.black, letterSpacing: 2, fontSize: 15)
  );
  static var myFontWhite = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.white, letterSpacing: 2, fontSize: 15)
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Center(child: Text('Tic-Tac-Toe', style: myFontWhite.copyWith(fontSize: 28),))
              ),

              Expanded(
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
              ),

              // Expanded(
              //     child: Center(child: Text('@michael_zakaria', style: myFontWhite.copyWith(fontSize: 18),))
              // ),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home(game: 'easy')));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    color: Colors.white,
                    child: Center(
                      child: Text('Easy', style: myFontBlack,),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home(game: 'hard')));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    color: Colors.white,
                    child: Center(
                      child: Text('Hard', style: myFontBlack,),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home(game: '2p')));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    color: Colors.white,
                    child: Center(
                      child: Text('2P', style: myFontBlack,),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




