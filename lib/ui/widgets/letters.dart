import 'dart:collection';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/logic/cubits/letters/letters_cubit.dart';
import 'package:hangman/ui/widgets/letter.dart';

class Letters extends StatelessWidget {
  final bool? disabled;
  const Letters({Key? key, this.disabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LettersCubit, LettersState>(
      builder: (context, state) {
        return Column(
            children: _getLetters(state.characters, state.charactersState,
                disabled: disabled ?? false));
      },
    );
  }

  List<Row> _getLetters(List<String> chars, Map<String, bool> charsStates,
      {disabled = false}) {
    List<Letter> letters = [];
    List<Row> rows = [];

    chars.forEach((k) {
      if ((charsStates[k] ?? false) && !disabled) {
        letters.add(Letter(k));
      } else {
        letters.add(Letter(k, disabled: true));
      }
      if (k == 'E' || k == 'K' || k == 'Ó' || k == 'U' || k == 'Ż') {
        rows.add(Row(
            mainAxisAlignment: MainAxisAlignment.center, children: letters));
        letters = [];
      }
    });
    return rows;
  }
}
