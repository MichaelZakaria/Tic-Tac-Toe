import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> displayXO = ["","","","","","","","",""];

  bool oTurn = false;

  int oScore = 0;
  int xScore = 0;

  int filledSpaces = 0;

  bool newAiTurn = false;

  static var myFontBlack = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.white, letterSpacing: 2, fontSize: 15)
  );
  static var myFontWhite = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.white, letterSpacing: 2, fontSize: 15)
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Player O', style: myFontWhite),
                        const SizedBox(height: 8),
                        Text(oScore.toString(), style: myFontWhite),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Player X', style: myFontWhite),
                        const SizedBox(height: 8),
                        Text(xScore.toString(), style: myFontWhite),
                      ],
                    )
                  ],
                )
            ),

            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () { _onTap(index); },
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey[700]!)),
                        child: Center(
                          child: Text(displayXO[index], style: const TextStyle(color: Colors.white, fontSize: 30)),
                        ),
                      ),
                    );
                  }
              ),
            ),

            Expanded(
                child: Center(
                  child: Text('Tic-Tac-Toe', style: myFontWhite,),
                )
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(int index) {
    if(oTurn && displayXO[index] == "") {
      setState(() {
        displayXO[index] = 'o';
        filledSpaces += 1;

        newAiTurn = true;
      });
    } else if(!oTurn && displayXO[index] == "") {
      setState(() {
        displayXO[index] = 'x';
        filledSpaces += 1;

        newAiTurn = true;
      });
    }

    oTurn = !oTurn;
    _checkWinner();
  }

  void _checkWinner() {
    // check first row
    if (displayXO[0] == displayXO[1] && displayXO[0] == displayXO[2] && displayXO[0] != "") {
      _showWhoWon(displayXO[0]);
    }

    // check second row
    else if (displayXO[3] == displayXO[4] && displayXO[3] == displayXO[5] && displayXO[3] != "") {
      _showWhoWon(displayXO[3]);
    }

    // check third row
    else if (displayXO[6] == displayXO[7] && displayXO[6] == displayXO[8] && displayXO[6] != "") {
      _showWhoWon(displayXO[6]);
    }

    // check first column
    else if (displayXO[0] == displayXO[3] && displayXO[0] == displayXO[6] && displayXO[0] != "") {
      _showWhoWon(displayXO[0]);
    }

    // check second column
    else if (displayXO[1] == displayXO[4] && displayXO[1] == displayXO[7] && displayXO[1] != "") {
      _showWhoWon(displayXO[1]);
    }

    // check third column
    else if (displayXO[2] == displayXO[5] && displayXO[2] == displayXO[8] && displayXO[2] != "") {
      _showWhoWon(displayXO[2]);
    }

    // check left to right diagonal
    else if (displayXO[0] == displayXO[4] && displayXO[0] == displayXO[8] && displayXO[0] != "") {
      _showWhoWon(displayXO[0]);
    }

    // check right to left diagonal
    else if (displayXO[2] == displayXO[4] && displayXO[2] == displayXO[6] && displayXO[2] != "") {
      _showWhoWon(displayXO[2]);
    }

    // check for a draw
    else if(filledSpaces == 9) {
      _showADraw();
    }

    else {
      _nextTurn();
    }

  }

  void _showWhoWon(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Winner: $winner'),
            actions: [
              FloatingActionButton(
                  onPressed: () {
                    _resetBoard();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Again',)
              )
            ],
          );
        }
    );

    if(winner == 'o') {
      oScore += 1;
    } else if(winner == 'x') {
      xScore += 1;
    }
  }

  void _resetBoard() {
    setState(() {
      displayXO.setAll(0, ["","","","","","","","",""]);
    });

    filledSpaces = 0;
  }

  void _showADraw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Draw'),
            actions: [
              FloatingActionButton(
                  onPressed: () {
                    _resetBoard();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Again')
              )
            ],
          );
        }
    );
  }

  void _aiTurn() {
    List<int> emptySpaces = [];
    for (int i = 0; i < displayXO.length; i++) {
      if(displayXO[i] == "") {
        emptySpaces.add(i);
      }
    }
    int randomSpace = Random().nextInt(emptySpaces.length);

    if(oTurn) {
      setState(() {
        displayXO[emptySpaces[randomSpace]] = 'o';
        filledSpaces += 1;
      });
    } else if(!oTurn) {
      setState(() {
        displayXO[emptySpaces[randomSpace]] = 'x';
        filledSpaces += 1;
      });
    }

    oTurn = !oTurn;
    _checkWinner();
  }

  void _nextTurn() {
    if(newAiTurn) {
      newAiTurn = !newAiTurn;
      _aiTurn();
    }
  }

}