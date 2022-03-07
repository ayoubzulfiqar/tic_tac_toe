import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  const Field(
      {Key? key,
      required this.idx,
      required this.onTap,
      required this.playerSymbol})
      : super(key: key);

  final int idx;
  final Function(int idx) onTap;
  final String playerSymbol;

  final BorderSide borderSide =
      const BorderSide(color: Colors.white, width: 2, style: BorderStyle.solid);

  void onhHandleTap() {
    if (playerSymbol == '') {
      onTap(idx);
    }
  }

  Border _determineBorder() {
    Border determinedBorder = Border.all();
    switch (idx) {
      case 0:
        determinedBorder = Border(bottom: borderSide, right: borderSide);
        break;
      case 1:
        determinedBorder =
            Border(left: borderSide, bottom: borderSide, right: borderSide);
        break;
      case 2:
        determinedBorder = Border(left: borderSide, bottom: borderSide);
        break;
      case 3:
        determinedBorder =
            Border(bottom: borderSide, right: borderSide, top: borderSide);
        break;
      case 4:
        determinedBorder = Border(
            left: borderSide,
            bottom: borderSide,
            right: borderSide,
            top: borderSide);
        break;
      case 5:
        determinedBorder =
            Border(left: borderSide, bottom: borderSide, top: borderSide);
        break;
      case 6:
        determinedBorder = Border(right: borderSide, top: borderSide);
        break;
      case 7:
        determinedBorder =
            Border(left: borderSide, top: borderSide, right: borderSide);
        break;
      case 8:
        determinedBorder = Border(left: borderSide, top: borderSide);
        break;
    }

    return determinedBorder;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onhHandleTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: _determineBorder(),
        ),
        child: Center(
          child: Text(
            playerSymbol,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
