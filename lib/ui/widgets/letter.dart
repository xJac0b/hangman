import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/logic/cubits/letters/letters_cubit.dart';

class Letter extends StatelessWidget {
  final String character;
  final bool? disabled;
  Letter(
    this.character, {
    this.disabled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: disabled != null
            ? null
            : () {
                BlocProvider.of<LettersCubit>(context).inputLetter(character);
              },
        style: ElevatedButton.styleFrom(minimumSize: Size(40, 40)),
        child: Text(character));
  }
}
