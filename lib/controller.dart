import 'package:flutter/material.dart';
import 'package:kids_puzzle/allWords.dart';
import 'package:kids_puzzle/messageBox.dart';

class Controller extends ChangeNotifier {
  int totalLetters = 0, lettersAnswered = 0, wordsAnswered = 0;
  bool generateWord = true, sessionCompleted = false;
  setUp({required int total}) {
    lettersAnswered = 0;
    totalLetters = total;
    print('total letters $totalLetters');
    notifyListeners();
  }

  incrementLetters({required BuildContext context}) {
    lettersAnswered++;
    if (lettersAnswered == totalLetters) {
      wordsAnswered++;
      if (wordsAnswered == allWords.length) {
        sessionCompleted = true;
      }
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => MessageBox(
                sessionCompleted: sessionCompleted,
              ));
    }
    notifyListeners();
  }

  requestWord({required bool request}) {
    generateWord = request;
    notifyListeners();
  }

  reset() {
    sessionCompleted = false;
    wordsAnswered = 0;
    generateWord = true;
  }
}
