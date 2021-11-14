import 'package:flutter/material.dart';
import 'package:x_o_game/Costum%20Widgets/popup.dart';
import 'package:x_o_game/ai/ai_logic.dart';
import 'package:x_o_game/ai/decision.dart';

class ProviderGame with ChangeNotifier {
  String player = "X";
  String player1name = "Player 1";
  String player2name = "Player 2";
  int player_1 = 0;
  int player_2 = 0;
  bool Ai = false;
  Map<int, List<int>> boardDict = {
    0: [0, 0],
    1: [0, 1],
    2: [0, 2],
    3: [1, 0],
    4: [1, 1],
    5: [1, 2],
    6: [2, 0],
    7: [2, 1],
    8: [2, 2],
  };
  List<List<String>> board = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
  ];
  Map<int, dynamic> boardColor = {
    0: Colors.blueGrey[100],
    1: Colors.blueGrey[100],
    2: Colors.blueGrey[100],
    3: Colors.blueGrey[100],
    4: Colors.blueGrey[100],
    5: Colors.blueGrey[100],
    6: Colors.blueGrey[100],
    7: Colors.blueGrey[100],
    8: Colors.blueGrey[100],
  };

  insertValue(BuildContext context, int index) async {
    List<int>? i = boardDict[index];
    if (board[i![0]][i[1]] == "") {
      board[i[0]][i[1]] = player;
      if (player == "X") {
        boardColor[index] = Colors.blueGrey;
      } else {
        boardColor[index] = Colors.blueGrey[300];
      }

      notifyListeners();
      if (checkWinner()) {
        await PopUp.showMyDialog(context,
            "${player == "X" ? player1name : player2name} wins !", true);
        if (player == "X") {
          player_1 += 1;
        } else {
          player_2 += 1;
        }
        resetGame();
      } else if (checkDrow()) {
        await PopUp.showMyDialog(context, "A drow !", true);
        resetGame();
      } else {
        changePlayer();
      }
    } else {
      await PopUp.showMyDialog(context, "Invalid choice !", false);
    }
  }

  changePlayer() {
    if (player == "X") {
      player = "O";
    } else {
      player = "X";
    }
    notifyListeners();
  }

  bool checkWinner() {
    if (board[0][0] == board[0][1] &&
        board[0][1] == board[0][2] &&
        board[0][2] == player) {
      boardColor[0] = Colors.red;
      boardColor[1] = Colors.red;
      boardColor[2] = Colors.red;
      return true;
    } else if (board[1][0] == board[1][1] &&
        board[1][1] == board[1][2] &&
        board[1][2] == player) {
      boardColor[3] = Colors.red;
      boardColor[4] = Colors.red;
      boardColor[5] = Colors.red;
      return true;
    } else if (board[2][0] == board[2][1] &&
        board[2][1] == board[2][2] &&
        board[2][2] == player) {
      boardColor[6] = Colors.red;
      boardColor[7] = Colors.red;
      boardColor[8] = Colors.red;
      return true;
    } else if (board[0][0] == board[1][1] &&
        board[1][1] == board[2][2] &&
        board[2][2] == player) {
      boardColor[0] = Colors.red;
      boardColor[4] = Colors.red;
      boardColor[8] = Colors.red;
      return true;
    } else if (board[0][2] == board[1][1] &&
        board[1][1] == board[2][0] &&
        board[2][0] == player) {
      boardColor[2] = Colors.red;
      boardColor[4] = Colors.red;
      boardColor[6] = Colors.red;
      return true;
    } else if (board[0][1] == board[1][1] &&
        board[1][1] == board[2][1] &&
        board[2][1] == player) {
      boardColor[1] = Colors.red;
      boardColor[4] = Colors.red;
      boardColor[7] = Colors.red;
      return true;
    } else if (board[0][0] == board[1][0] &&
        board[1][0] == board[2][0] &&
        board[2][0] == player) {
      boardColor[0] = Colors.red;
      boardColor[3] = Colors.red;
      boardColor[6] = Colors.red;
      return true;
    } else if (board[0][2] == board[1][2] &&
        board[1][2] == board[2][2] &&
        board[2][2] == player) {
      boardColor[2] = Colors.red;
      boardColor[5] = Colors.red;
      boardColor[8] = Colors.red;
      return true;
    }
    return false;
  }

  gameMode(bool) {
    Ai = bool;
    ChangeNotifier();
  }

  bool checkDrow() {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == "") {
          return false;
        }
      }
    }
    return true;
  }

  newGame() {
    player_1 = 0;
    player_2 = 0;
    player = "O";
    resetGame();
  }

  resetGame() {
    boardDict = {
      0: [0, 0],
      1: [0, 1],
      2: [0, 2],
      3: [1, 0],
      4: [1, 1],
      5: [1, 2],
      6: [2, 0],
      7: [2, 1],
      8: [2, 2],
    };
    board = [
      ["", "", ""],
      ["", "", ""],
      ["", "", ""],
    ];
    boardColor = {
      0: Colors.blueGrey[100],
      1: Colors.blueGrey[100],
      2: Colors.blueGrey[100],
      3: Colors.blueGrey[100],
      4: Colors.blueGrey[100],
      5: Colors.blueGrey[100],
      6: Colors.blueGrey[100],
      7: Colors.blueGrey[100],
      8: Colors.blueGrey[100],
    };
    changePlayer();
    notifyListeners();
  }

  int getIndex(int i, int j) {
    if (i == 0 && j == 0) {
      return 0;
    } else if (i == 0 && j == 1) {
      return 1;
    } else if (i == 0 && j == 2) {
      return 2;
    } else if (i == 1 && j == 0) {
      return 3;
    } else if (i == 1 && j == 1) {
      return 4;
    } else if (i == 1 && j == 2) {
      return 5;
    } else if (i == 2 && j == 0) {
      return 6;
    } else if (i == 2 && j == 1) {
      return 7;
    } else {
      return 8;
    }
  }

  changePlayerName(String name, int index) {
    if (name.isEmpty || name == " ") {
      return false;
    }
    if (index == 1) {
      player1name = name;
    } else {
      player2name = name;
    }
    notifyListeners();
  }

// theme data

  final _darkTheme = ThemeData(
    primarySwatch: Colors.brown,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    dividerColor: Colors.black12,
  );

  final _lightTheme = ThemeData(
    primarySwatch: Colors.brown,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: Colors.brown[100],
    dividerColor: Colors.white54,
  );
  bool nightMode = false;
  Color buttonColor = Colors.brown;
  var textcolor = Colors.brown[800];
  var bgcolor = Colors.brown[100];

  ThemeData themeData = ThemeData(
    primarySwatch: Colors.brown,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    backgroundColor: Colors.brown[100],
    dividerColor: Colors.white54,
  );

  void setDarkMode() async {
    themeData = _darkTheme;
    nightMode = !nightMode;
    textcolor = Colors.white;
    buttonColor = Colors.greenAccent;
    bgcolor = Colors.grey[700];
    notifyListeners();
  }

  void setLightMode() async {
    themeData = _lightTheme;
    bgcolor = Colors.brown[100];
    textcolor = Colors.brown[800];
    buttonColor = Colors.brown;
    nightMode = !nightMode;
    notifyListeners();
  }

  //Auto play AI
autoPlay(BuildContext context, int index) async {
  List<int>? i = boardDict[index];
  if (board[i![0]][i[1]] == "") {
    player = "X";
    board[i[0]][i[1]] = "X";
    boardColor[index] = Colors.blueGrey;
    notifyListeners();
    if (checkWinner()) {
      await PopUp.showMyDialog(context, "$player1name wins !", true);
      player_1 += 1;
      resetGame();
    } else if (checkDrow()) {
      await PopUp.showMyDialog(context, "A drow !", true);
      resetGame();
    }

    // AI turn

    else {
      AI jarvis = AI(board);
      player = "O";
      Decision d = jarvis.getDecision();
    
      board[d.row][d.column] = "O";
    
      boardColor[getIndex(d.row, d.column)] = Colors.blueGrey[300];
      notifyListeners();
      if (checkWinner()) {
        await PopUp.showMyDialog(context, "J.A.R.V.I.S wins !", true);
        player_2 += 1;
        resetGame();
      } else if (checkDrow()) {
        await PopUp.showMyDialog(context, "A drow !", true);
        resetGame();
      }
    }
  } else {
    await PopUp.showMyDialog(context, "Invalid choice !", false);
  }
  // boardColor[index] = Colors.blueGrey[300];
}
}
