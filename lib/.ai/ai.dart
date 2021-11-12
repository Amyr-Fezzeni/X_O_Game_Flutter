import 'dart:math';
import 'decision.dart';

class AI {
  final List<List<String>> _field;
  final String _playerChar = "X";
  final String _aiChar = "O";
  late Decision _decision;

  AI(this._field);

  Decision getDecision() {
    _makeDecision();
    print(_field);
    return _decision;
  }

  _makeDecision() {
    if (_isCenterEmpty()) return;
    if (_aiIsCloseToWin()) return;
    if (_playerIsCloseToWin()) return;
    if (_playerHasOneChar()) return;
    _chooseRandom();
  }

  bool _isCenterEmpty() {
    if (_field[1][1].isEmpty) {
      _decision = Decision(1, 1);
      return true;
    } else {
      return false;
    }
  }

  bool _aiIsCloseToWin() {
    return _hasTwoCharsInLine(0, 0, 0, 1, 0, 2, _aiChar) ||
        _hasTwoCharsInLine(1, 0, 1, 1, 1, 2, _aiChar) ||
        _hasTwoCharsInLine(2, 0, 2, 1, 2, 2, _aiChar) ||
        _hasTwoCharsInLine(0, 0, 1, 0, 2, 0, _aiChar) ||
        _hasTwoCharsInLine(0, 1, 1, 1, 2, 1, _aiChar) ||
        _hasTwoCharsInLine(0, 2, 1, 2, 2, 2, _aiChar) ||
        _hasTwoCharsInLine(0, 0, 1, 1, 2, 2, _aiChar) ||
        _hasTwoCharsInLine(0, 2, 1, 1, 2, 0, _aiChar);
  }

  bool _playerIsCloseToWin() {
    return _hasTwoCharsInLine(0, 0, 0, 1, 0, 2, _playerChar) ||
        _hasTwoCharsInLine(1, 0, 1, 1, 1, 2, _playerChar) ||
        _hasTwoCharsInLine(2, 0, 2, 1, 2, 2, _playerChar) ||
        _hasTwoCharsInLine(0, 0, 1, 0, 2, 0, _playerChar) ||
        _hasTwoCharsInLine(0, 1, 1, 1, 2, 1, _playerChar) ||
        _hasTwoCharsInLine(0, 2, 1, 2, 2, 2, _playerChar) ||
        _hasTwoCharsInLine(0, 0, 1, 1, 2, 2, _playerChar) ||
        _hasTwoCharsInLine(0, 2, 1, 1, 2, 0, _playerChar);
  }

  bool _hasTwoCharsInLine(
      int r1, int c1, int r2, int c2, int r3, int c3, String side) {
    if (_field[r1][c1] == side &&
        _field[r2][c2] == side &&
        _field[r3][c3].isEmpty) {
      _decision = Decision(r3, c3);
      return true;
    }
    if (_field[r1][c1] == side &&
        _field[r3][c3] == side &&
        _field[r2][c2].isEmpty) {
      _decision = Decision(r2, c2);
      return true;
    }
    if (_field[r2][c2] == side &&
        _field[r3][c3] == side &&
        _field[r1][c1].isEmpty) {
      _decision = Decision(r1, c1);
      return true;
    }
    return false;
  }

  bool _playerHasOneChar() {
    return _playerHasOneCharInLine(0, 0, 0, 1, 0, 2) ||
        _playerHasOneCharInLine(1, 0, 1, 1, 1, 2) ||
        _playerHasOneCharInLine(2, 0, 2, 1, 2, 2) ||
        _playerHasOneCharInLine(0, 0, 1, 0, 2, 0) ||
        _playerHasOneCharInLine(0, 1, 1, 1, 2, 1) ||
        _playerHasOneCharInLine(0, 2, 1, 2, 2, 2) ||
        _playerHasOneCharInLine(0, 0, 1, 1, 2, 2) ||
        _playerHasOneCharInLine(0, 2, 1, 1, 2, 0);
  }

  _playerHasOneCharInLine(int r1, int c1, int r2, int c2, int r3, int c3) {
    if (_field[r1][c1] == _playerChar &&
        _field[r2][c2].isEmpty &&
        _field[r3][c3].isEmpty) {
      _decision = Decision(r3, c3);
      return true;
    }
    if (_field[r2][c2] == _playerChar &&
        _field[r1][c1].isEmpty &&
        _field[r3][c3].isEmpty) {
      _decision = Decision(r1, c1);
      return true;
    }
    if (_field[r3][c3] == _playerChar &&
        _field[r1][c1].isEmpty &&
        _field[r2][c2].isEmpty) {
      _decision = Decision(r1, c1);
      return true;
    }
    return false;
  }

  _chooseRandom() {
    var random = Random();
    while (true) {
      var _row = random.nextInt(3);
      var _column = random.nextInt(3);

      if (_field[_row][_column].isEmpty) {
        _decision = Decision(_row, _column);
        break;
      }
    }
  }
}
