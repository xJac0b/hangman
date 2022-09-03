part of 'letters_cubit.dart';

class LettersState {
  final List<String> characters;
  final String? newChar;
  Map<String, bool> charactersState; // true - active / false - disabled

  LettersState(this.characters, this.charactersState, {this.newChar});
  LettersState copyWith(String char) {
    charactersState[char] = false;
    return LettersState(characters, charactersState, newChar: char);
  }
}
