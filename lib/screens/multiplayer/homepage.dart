import 'package:flutter/material.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/screens/multiplayer/dialog_box.dart';

class MultiPlayerHomePage extends StatefulWidget {
  const MultiPlayerHomePage({Key? key}) : super(key: key);

  @override
  State<MultiPlayerHomePage> createState() => _MultiPlayerHomePageState();
}

class _MultiPlayerHomePageState extends State<MultiPlayerHomePage> {
  Widget gridBuild() {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  clicked(index);
                },
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: Center(
                    child: Text(
                      xOrOList[index],
                      style: TextStyle(
                          color: xOrOList[index] == "X"
                              ? AppColors.littleWhite
                              : AppColors.littleWhite,
                          fontSize: 40),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget pontTable() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Player 0",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 20),
                Text(
                  scoreO.toString(),
                  style: const TextStyle(fontSize: 30),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Player X",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 20),
                Text(
                  scoreX.toString(),
                  style: const TextStyle(fontSize: 30),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget buildTurn() {
    return Container(
      child: Center(
        child: Text(
          turnOfO ? "Turn of O" : "Turn of X",
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }

  void clicked(int index) {
    setState(() {
      if (turnOfO && xOrOList[index] == '') {
        xOrOList[index] = 'O';
        filledBox += 1;
      } else if (!turnOfO && xOrOList[index] == '') {
        xOrOList[index] = 'X';
        filledBox += 1;
      }
      turnOfO = !turnOfO;
      // checkWinnerFunction
      checkWinner();
    });
  }

  void checkWinner() {
    // first row
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      // showALterDialogBOx of Winner 'O'
      showAlertDialogBox("Winner", xOrOList[0]);
      return;
    }
    // secondRow
    if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3] != '') {
      // show
      showAlertDialogBox("Winner", xOrOList[3]);
      return;
    }
    // thirdRow
    if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      // show winner
      showAlertDialogBox("Winner", xOrOList[6]);
      return;
    }
    // first column
    if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0] != '') {
      showAlertDialogBox("Winner", xOrOList[0]);
      return;
      //winner dialog
    }
    if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      showAlertDialogBox("Winner", xOrOList[1]);
      return;
    }
    // second COlumn
    if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2] != '') {
      showAlertDialogBox("Winner", xOrOList[2]);
      return;
    }
    // diagonal
    if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      showAlertDialogBox("Winner", xOrOList[0]);
      return;
    }
    if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != "") {
      showAlertDialogBox("Winner", xOrOList[2]);
      return;
    }
    if (filledBox == 9) {
      // show DialogDraw
      showAlertDialogBox("Draw", "");
    }
  }

  void showAlertDialogBox(String title, String winner) {
    showAlertDialog(
        context: context,
        title: title,
        content: winner == ''
            ? 'The match ended in a draw'
            : 'The winner is ${winner.toUpperCase()}',
        defaultActionText: 'Ok',
        onOkPressed: () {
          cleanBoard();
          Navigator.pop(context);
        });
    if (winner == 'O') {
      scoreO += 1;
    } else if (winner == 'X') {
      scoreX += 1;
    }
  }

  void cleanBoard() {
    setState(() {
      for (var i = 0; i < 9; i++) {
        xOrOList[i] = '';
      }
    });
    filledBox = 0;
  }

  int scoreX = 0;
  int scoreO = 0;
  bool turnOfO = true;
  int filledBox = 0;
  final List<String> xOrOList = ['', '', '', '', '', '', '', '', ''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Tic Tac Toe",
          style: TextStyle(fontSize: 23),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                cleanBoard();
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const SizedBox(height: 30),
          pontTable(),
          gridBuild(),
          buildTurn(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
