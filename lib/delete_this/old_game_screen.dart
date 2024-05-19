import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/common/fonts/my_fonts.dart';

class OldGameScreen extends StatefulWidget {
  const OldGameScreen({super.key, required this.game});

  final String game;

  @override
  State<OldGameScreen> createState() => _OldGameScreenState();
}

class _OldGameScreenState extends State<OldGameScreen> {

  /// Variables
  List<String> displayXO = ["","","","","","","","",""];

  bool oTurn = false;

  int oScore = 0;
  int xScore = 0;

  int filledSpaces = 0;

  bool newAiTurn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          children: [

            /// Score
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Player O', style: MyFonts.myFontWhite),
                        const SizedBox(height: 8),
                        Text(oScore.toString(), style: MyFonts.myFontWhite),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Player X', style: MyFonts.myFontWhite),
                        const SizedBox(height: 8),
                        Text(xScore.toString(), style: MyFonts.myFontWhite),
                      ],
                    )
                  ],
                )
            ),

            /// Board
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

            /// Title
            Expanded(
                child: Center(
                  child: Text('Tic-Tac-Toe', style: MyFonts.myFontWhite),
                )
            ),
          ],
        ),
      ),
    );
  }

  /// Methods
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

  String? _hardAiCheckWinner() {
    // check first row
    if (displayXO[0] == displayXO[1] && displayXO[0] == displayXO[2] && displayXO[0] != "") {
      return displayXO[0];
    }

    // check second row
    else if (displayXO[3] == displayXO[4] && displayXO[3] == displayXO[5] && displayXO[3] != "") {
      return displayXO[3];
    }

    // check third row
    else if (displayXO[6] == displayXO[7] && displayXO[6] == displayXO[8] && displayXO[6] != "") {
      return displayXO[6];
    }

    // check first column
    else if (displayXO[0] == displayXO[3] && displayXO[0] == displayXO[6] && displayXO[0] != "") {
      return displayXO[0];
    }

    // check second column
    else if (displayXO[1] == displayXO[4] && displayXO[1] == displayXO[7] && displayXO[1] != "") {
      return displayXO[1];
    }

    // check third column
    else if (displayXO[2] == displayXO[5] && displayXO[2] == displayXO[8] && displayXO[2] != "") {
      return displayXO[2];
    }

    // check left to right diagonal
    else if (displayXO[0] == displayXO[4] && displayXO[0] == displayXO[8] && displayXO[0] != "") {
      return displayXO[0];
    }

    // check right to left diagonal
    else if (displayXO[2] == displayXO[4] && displayXO[2] == displayXO[6] && displayXO[2] != "") {
      return displayXO[2];
    }

    // check for a draw
    else if(filledSpaces == 9) {
      return 'tie';
    }

    else {
      return null;
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
    for (int i = 0; i < 9; i++) {
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
      if(widget.game == 'easy') _aiTurn();
      if(widget.game == 'hard') {
        if (filledSpaces <= 1) {
          _aiTurn();
        } else {
          _hardAiTurn();
        }
      }

    }
  }

  Map<String, int> xScores = {
    'x': 1,
    'o': -1,
    'tie': 0
  };

  Map<String, int> oScores = {
    'x': -1,
    'o': 1,
    'tie': 0
  };

  int _minMax(List<String> board, int depth, bool isMaximizing) {
    String? result = _hardAiCheckWinner();
    if (result != null) {

      if(oTurn) {
        return oScores[result]! * ((9 - filledSpaces) + 1);
      } else {
        return xScores[result]! * ((9 - filledSpaces) + 1);
      }

    }

    if(isMaximizing) {

      int bestScore = -1000;

      for (int i = 0; i < 9; i++) {
        if (displayXO[i] == "") {

         if (oTurn) {
            displayXO[i] = 'o';
            filledSpaces += 1;
          } else if (!oTurn) {
            displayXO[i] = 'x';
            filledSpaces += 1;
          }

         int score = _minMax(displayXO, depth + 1, false);

          displayXO[i] = '';
          filledSpaces -= 1;

          bestScore = max(score, bestScore);
        }
      }
      return bestScore;

    } else {

      int bestScore = 1000;

      for (int i = 0; i < 9; i++) {
        if (displayXO[i] == "") {

          if (!oTurn) {
            displayXO[i] = 'o';
            filledSpaces += 1;
          } else if (oTurn) {
            displayXO[i] = 'x';
            filledSpaces += 1;
          }

          int score = _minMax(displayXO, depth + 1, true);

          displayXO[i] = '';
          filledSpaces -= 1;

          bestScore = min(score, bestScore);
        }
      }
      return bestScore;

    }
  }

  void _hardAiTurn() {

    int bestScore = -1000;
    int? bestMove;

    for (int i = 0; i < 9; i++) {
      if (displayXO[i] == "") {
        if (oTurn) {
          displayXO[i] = 'o';
          filledSpaces += 1;
        } else if (!oTurn) {
          displayXO[i] = 'x';
          filledSpaces += 1;
        }

          int score = _minMax(displayXO, 0, false);

          displayXO[i] = '';
          filledSpaces -= 1;

          if (score > bestScore) {
            bestScore = score;
            bestMove = i;
          }
      }
    }

    if(bestMove != null) {
      if(oTurn) {
        setState(() {
          displayXO[bestMove!] = 'o';
          filledSpaces += 1;
        });
      } else if(!oTurn) {
        setState(() {
          displayXO[bestMove!] = 'x';
          filledSpaces += 1;
        });
      }
    }


    oTurn = !oTurn;
    _checkWinner();
  }

}