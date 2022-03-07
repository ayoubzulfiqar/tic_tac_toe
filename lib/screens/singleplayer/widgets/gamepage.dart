import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/singleplayer/utils/ai.dart';
import 'package:tic_tac_toe/screens/singleplayer/widgets/filed.dart';
import 'package:tic_tac_toe/screens/singleplayer/widgets/presenter.dart';

class GamePage extends StatefulWidget {
  final String title;

  const GamePage(this.title, {Key? key}) : super(key: key);

  @override
  GamePageState createState() => GamePageState();
}

class GamePageState extends State<GamePage> {
  late List<int> board;
  late int _currentPlayer;

  late GamePresenter _presenter;

  GamePageState() {
    _presenter = GamePresenter(_movePlayed, _onGameEnd);
  }

  void _onGameEnd(int winner) {
    var title = "Game over !";
    var content = "You lose ";
    switch (winner) {
      case Ai.human:
        title = "Congratulations!";
        content = "You managed to beat an unbeatable AI!";
        break;
      case Ai.aiPlayer:
        title = "Game Over !";
        content = "You lose ";
        break;
      default:
        title = "Draw !";
        content = "No winners here.";
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    setState(() {
                      reinitialize();
                      Navigator.of(context).pop();
                    });
                  },
                  child: const Text(
                    "Restart",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          );
        });
  }

  void _movePlayed(int idx) {
    setState(() {
      board[idx] = _currentPlayer;

      if (_currentPlayer == Ai.human) {
        _currentPlayer = Ai.aiPlayer;
        _presenter.onHumanPlayed(board);
      } else {
        _currentPlayer = Ai.human;
      }
    });
  }

  String? getSymbolForIdx(int idx) {
    return Ai.symbol[board[idx]];
  }

  @override
  void initState() {
    super.initState();
    reinitialize();
  }

  void reinitialize() {
    _currentPlayer = Ai.human;
    board = List.generate(9, (idx) => 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.darkBlack, AppColors.lightBlack],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Container(
            width: 300,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    "You are playing as - X",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                const SizedBox(height: 70),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: List.generate(9, (idx) {
                      return SizedBox(
                        height: 200,
                        width: 200,
                        child: Field(
                            idx: idx,
                            onTap: _movePlayed,
                            playerSymbol: getSymbolForIdx(idx)!),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
