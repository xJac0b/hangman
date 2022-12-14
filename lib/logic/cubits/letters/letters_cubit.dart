import 'package:bloc/bloc.dart';

part 'letters_state.dart';

class LettersCubit extends Cubit<LettersState> {
  LettersCubit()
      : super(LettersState([
          "A",
          "Ą",
          "B",
          "C",
          "Ć",
          "D",
          "E",
          "Ę",
          "F",
          "G",
          "H",
          "I",
          "J",
          "K",
          "L",
          "Ł",
          "M",
          "N",
          "Ń",
          "O",
          "Ó",
          "P",
          "Q",
          "R",
          "S",
          "Ś",
          "T",
          "U",
          "V",
          "W",
          "X",
          "Y",
          "Z",
          "Ź",
          "Ż",
        ], {
          "A": true,
          "Ą": true,
          "B": true,
          "C": true,
          "Ć": true,
          "D": true,
          "E": true,
          "Ę": true,
          "F": true,
          "G": true,
          "H": true,
          "I": true,
          "J": true,
          "K": true,
          "L": true,
          "Ł": true,
          "M": true,
          "N": true,
          "Ń": true,
          "O": true,
          "Ó": true,
          "P": true,
          "Q": true,
          "R": true,
          "S": true,
          "Ś": true,
          "T": true,
          "U": true,
          "V": true,
          "W": true,
          "X": true,
          "Y": true,
          "Z": true,
          "Ź": true,
          "Ż": true
        }));

  void inputLetter(String c) {
    emit(state.copyWith(c));
  }
}
