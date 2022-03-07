import './ai.dart';

class Utils {
  static bool isBoardFull(List<int> board) {
    for (var val in board) {
      if (val == Ai.emptySpace) return false;
    }

    return true;
  }

  static bool isMoveLegal(List<int> board, int move) {
    if (move < 0 || move >= board.length || board[move] != Ai.emptySpace) {
      return false;
    }

    return true;
  }

  static int evaluateBoard(List<int> board) {
    for (var list in Ai.winConditionList) {
      if (board[list[0]] != Ai.emptySpace &&
          board[list[0]] == board[list[1]] &&
          board[list[0]] == board[list[2]]) {
        return board[list[0]];
      }
    }

    if (isBoardFull(board)) {
      return Ai.draw;
    }

    return Ai.noWinnersYet;
  }

  static int flipPlayer(int currentPlayer) {
    return -1 * currentPlayer;
  }
}
