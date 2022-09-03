part of 'word_cubit.dart';

class WordState {
  final String word;
  final Set<String> usedChars;

  WordState(this.word, this.usedChars);

  WordState copyWith(String c) => WordState(word, usedChars..add(c));
}
