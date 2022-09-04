import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/logic/cubits/letters/letters_cubit.dart';

class Letter extends StatelessWidget {
  final String character;
  final bool? disabled;
  const Letter(
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
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(40, 40),
          primary: Theme.of(context).primaryColor,
          onPrimary: Theme.of(context).textTheme.bodyText1!.color,
        ),
        child: Text(character));
  }
}
