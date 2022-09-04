import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hangman/data/repo/word_repo.dart';
import 'package:hangman/logic/cubits/letters/letters_cubit.dart';

part 'word_state.dart';

class WordCubit extends Cubit<WordState> {
  final LettersCubit lettersCubit;
  late StreamSubscription lettersStreamSubscription;
  WordCubit({required String category, required this.lettersCubit})
      : super(WordState('', {})) {
    setWord(category);
    lettersStreamSubscription = lettersCubit.stream.listen((letterState) {
      if (letterState.newChar != null) {
        if (state.word.contains(letterState.newChar ?? '')) {
          addLetter(letterState.newChar ?? '');
        } else {
          wrongLetter();
        }
      }
    });
  }

  void wrongLetter() {
    emit(state.copyWithStatus(WordStatus.mistake));
  }

  void addLetter(String char) {
    emit(state.copyWith(char));
    bool full = true;
    for (var code in state.word.runes) {
      if (String.fromCharCode(code) != ' ' &&
          !state.usedChars.contains(String.fromCharCode(code))) {
        full = false;
      }
    }
    if (full) emit(state.copyWithStatus(WordStatus.full));
  }

  @override
  Future<void> close() {
    lettersStreamSubscription.cancel();
    return super.close();
  }

  void setWord(String category) async {
    WordRepository repo = WordRepository();
    String word = await repo.getWordByCategory(category);
    emit(WordState(word, {}));
  }
}
