part of 'hangman_cubit.dart';

enum HangmanStatus { inGame, gameOver, win }

class HangmanState {
  final int level; // 0 - 9
  final HangmanStatus status;
  HangmanState({required this.level, this.status = HangmanStatus.inGame});
}
