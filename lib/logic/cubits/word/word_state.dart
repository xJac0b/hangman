part of 'word_cubit.dart';

enum WordStatus { inProgress, mistake, full }

class WordState {
  final String word;
  final Set<String> usedChars;
  final WordStatus status;
  WordState(this.word, this.usedChars, {this.status = WordStatus.inProgress});

  WordState copyWith(String c) => WordState(word, usedChars..add(c));
  WordState copyWithStatus(WordStatus status) =>
      WordState(word, usedChars, status: status);
}
