import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hangman/logic/cubits/word/word_cubit.dart';

part 'hangman_state.dart';

class HangmanCubit extends Cubit<HangmanState> {
  final WordCubit wordCubit;
  late StreamSubscription wordStreamSubscription;
  HangmanCubit({required this.wordCubit}) : super(HangmanState(level: -1)) {
    wordStreamSubscription = wordCubit.stream.listen((wordState) {
      if (wordState.status == WordStatus.mistake) increaseLevel();
      if (wordState.status == WordStatus.full) win();
    });
  }

  void win() {
    emit(HangmanState(level: state.level, status: HangmanStatus.win));
  }

  void increaseLevel() {
    HangmanStatus status;
    if (state.level == 8) {
      status = HangmanStatus.gameOver;
    } else {
      status = HangmanStatus.inGame;
    }
    emit(HangmanState(level: state.level + 1, status: status));
  }

  @override
  Future<void> close() {
    wordStreamSubscription.cancel();
    return super.close();
  }
}
