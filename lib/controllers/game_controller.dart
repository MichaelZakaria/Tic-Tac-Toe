import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/dialogs/my_alert_dialog.dart';

class GameController extends GetxController {
  static GameController get instance => Get.find();

  GameController({required this.game});

  /// Variables
  String game;

  RxList<String> displayXO = <String>["","","","","","","","",""].obs;

  RxBool oTurn = false.obs;

  RxInt oScore = 0.obs;
  RxInt xScore = 0.obs;

  int filledSpaces = 0;

  bool newAiTurn = false;

  RxBool disableTap = false.obs;

  RxBool isTurnVisible = true.obs;

  RxList<bool> isAnimatingCell = <bool>[false,false,false,false,false,false,false,false,false].obs;

  /// Methods
  void onTap(int index) {
    if(oTurn.value && displayXO[index] == "") {
        AudioPlayer().play(AssetSource('tap_spound.aiff'));

        displayXO[index] = 'o';
        filledSpaces += 1;

        newAiTurn = true;

        oTurn.value = !oTurn.value;
        _checkWinner();

    } else if(!oTurn.value && displayXO[index] == "") {
      AudioPlayer().play(AssetSource('tap_spound.aiff'));

        displayXO[index] = 'x';
        filledSpaces += 1;

        newAiTurn = true;

        oTurn.value = !oTurn.value;
        _checkWinner();

    }
  }

  void _checkWinner() {
    // check first row
    if (displayXO[0] == displayXO[1] && displayXO[0] == displayXO[2] && displayXO[0] != "") {
      isAnimatingCell[0] = true;
      isAnimatingCell[1] = true;
      isAnimatingCell[2] = true;
      _showWhoWon(displayXO[0]);
    }

    // check second row
    else if (displayXO[3] == displayXO[4] && displayXO[3] == displayXO[5] && displayXO[3] != "") {
      isAnimatingCell[3] = true;
      isAnimatingCell[4] = true;
      isAnimatingCell[5] = true;
      _showWhoWon(displayXO[3]);
    }

    // check third row
    else if (displayXO[6] == displayXO[7] && displayXO[6] == displayXO[8] && displayXO[6] != "") {
      isAnimatingCell[6] = true;
      isAnimatingCell[7] = true;
      isAnimatingCell[8] = true;
      _showWhoWon(displayXO[6]);
    }

    // check first column
    else if (displayXO[0] == displayXO[3] && displayXO[0] == displayXO[6] && displayXO[0] != "") {
      isAnimatingCell[0] = true;
      isAnimatingCell[3] = true;
      isAnimatingCell[6] = true;
      _showWhoWon(displayXO[0]);
    }

    // check second column
    else if (displayXO[1] == displayXO[4] && displayXO[1] == displayXO[7] && displayXO[1] != "") {
      isAnimatingCell[1] = true;
      isAnimatingCell[4] = true;
      isAnimatingCell[7] = true;
      _showWhoWon(displayXO[1]);
    }

    // check third column
    else if (displayXO[2] == displayXO[5] && displayXO[2] == displayXO[8] && displayXO[2] != "") {
      isAnimatingCell[2] = true;
      isAnimatingCell[5] = true;
      isAnimatingCell[8] = true;
      _showWhoWon(displayXO[2]);
    }

    // check left to right diagonal
    else if (displayXO[0] == displayXO[4] && displayXO[0] == displayXO[8] && displayXO[0] != "") {
      isAnimatingCell[0] = true;
      isAnimatingCell[4] = true;
      isAnimatingCell[8] = true;
      _showWhoWon(displayXO[0]);
    }

    // check right to left diagonal
    else if (displayXO[2] == displayXO[4] && displayXO[2] == displayXO[6] && displayXO[2] != "") {
      isAnimatingCell[2] = true;
      isAnimatingCell[4] = true;
      isAnimatingCell[6] = true;
      _showWhoWon(displayXO[2]);
    }

    // check for a draw
    else if(filledSpaces == 9) {
      _showWhoWon('tie');
    }

    else {
      nextTurn();
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
    AudioPlayer().play(AssetSource('winning_sound.wav'));

    isTurnVisible.value = false;
    disableTap.value = true;

    if(winner == 'o') {
      oScore += 1;
    } else if(winner == 'x') {
      xScore += 1;
    }

    Future.delayed(
        const Duration(seconds: 1),
        () {
          showDialog(
              barrierDismissible: false,
              context: Get.context!,
              builder: (BuildContext context) {
                return MyAlertDialog(winner: winner);
              }
          );
        }
    );
  }

  void resetBoard() {

    displayXO.setAll(0, ["","","","","","","","",""]);
    isAnimatingCell.setAll(0, [false,false,false,false,false,false,false,false,false]);
    filledSpaces = 0;
  }

  void _aiTurn() {

    disableTap.value = true;

    Future.delayed(const Duration(seconds: 1), () {
      AudioPlayer().play(AssetSource('tap_spound.aiff'));

      List<int> emptySpaces = [];
      for (int i = 0; i < 9; i++) {
        if(displayXO[i] == "") {
          emptySpaces.add(i);
        }
      }
      int randomSpace = Random().nextInt(emptySpaces.length);

      if(oTurn.value) {

        displayXO[emptySpaces[randomSpace]] = 'o';
        filledSpaces += 1;

      } else if(!oTurn.value) {

        displayXO[emptySpaces[randomSpace]] = 'x';
        filledSpaces += 1;

      }

      oTurn.value = !oTurn.value;
      _checkWinner();

      disableTap.value  = false;
    });

  }

  void nextTurn() {
    if(newAiTurn) {
        newAiTurn = !newAiTurn;

        if(game == 'easy') {_aiTurn();}
        else if(game == 'hard') {
          if (filledSpaces <= 1) {_aiTurn();}
          else {_hardAiTurn();}
        }
        else {disableTap.value = false;}

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

      if(oTurn.value) {
        return oScores[result]! * ((9 - filledSpaces) + 1);
      } else {
        return xScores[result]! * ((9 - filledSpaces) + 1);
      }

    }

    if(isMaximizing) {

      int bestScore = -1000;

      for (int i = 0; i < 9; i++) {
        if (displayXO[i] == "") {

          if (oTurn.value) {
            displayXO[i] = 'o';
            filledSpaces += 1;
          } else if (!oTurn.value) {
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

          if (!oTurn.value) {
            displayXO[i] = 'o';
            filledSpaces += 1;
          } else if (oTurn.value) {
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

    disableTap.value = true;

    Future.delayed(const Duration(seconds: 1), () {
      AudioPlayer().play(AssetSource('tap_spound.aiff'));

      int bestScore = -1000;
      int? bestMove;

      for (int i = 0; i < 9; i++) {
        if (displayXO[i] == "") {
          if (oTurn.value) {
            displayXO[i] = 'o';
            filledSpaces += 1;
          } else if (!oTurn.value) {
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
        if(oTurn.value) {

          displayXO[bestMove] = 'o';
          filledSpaces += 1;

        } else if(!oTurn.value) {

          displayXO[bestMove] = 'x';
          filledSpaces += 1;

        }
      }


      oTurn.value = !oTurn.value;
      _checkWinner();

      disableTap.value = false;
    });
  }
}

