import 'dart:async';

import 'package:tic_tac_toe/screens/singleplayer/utils/ai.dart';
import 'package:tic_tac_toe/screens/singleplayer/utils/util.dart';

class GamePresenter {
  // callbacks into our UI
  void Function(int idx) showMoveOnUi;
  void Function(int winningPlayer) showGameEnd;

  late Ai _aiPlayer;

  GamePresenter(this.showMoveOnUi, this.showGameEnd) {
    _aiPlayer = Ai();
  }

  void onHumanPlayed(List<int> board) async {
    int evaluation = Utils.evaluateBoard(board);
    if (evaluation != Ai.noWinnersYet) {
      onGameEnd(evaluation);
      return;
    }

    int aiMove = await Future(() => _aiPlayer.play(board, Ai.aiPlayer));

    board[aiMove] = Ai.aiPlayer;

    evaluation = Utils.evaluateBoard(board);
    if (evaluation != Ai.noWinnersYet) {
      onGameEnd(evaluation);
    } else {
      showMoveOnUi(aiMove);
    }
  }

  void onGameEnd(int winner) {
    showGameEnd(winner);
  }
}
