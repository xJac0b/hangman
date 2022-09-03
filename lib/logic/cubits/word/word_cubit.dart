import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hangman/logic/cubits/letters/letters_cubit.dart';
import 'package:meta/meta.dart';

part 'word_state.dart';

class WordCubit extends Cubit<WordState> {
  final LettersCubit lettersCubit;
  late StreamSubscription lettersStreamSubscription;
  WordCubit({required String word, required this.lettersCubit})
      : super(WordState(word, {})) {
    lettersStreamSubscription = lettersCubit.stream.listen((state) {
      print(state.newChar);
      if (state.newChar != null) addLetter(state.newChar ?? '');
    });
  }

  void addLetter(String char) {
    emit(state.copyWith(char));
  }

  Future<void> close() {
    lettersStreamSubscription.cancel();
    return super.close();
  }
}
