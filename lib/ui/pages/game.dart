import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/logic/cubits/letters/letters_cubit.dart';
import 'package:hangman/logic/cubits/word/word_cubit.dart';
import 'package:hangman/ui/widgets/letters.dart';
import 'package:hangman/ui/widgets/word.dart';

class Game extends StatelessWidget {
  final String category;
  const Game({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LettersCubit>(create: (context) => LettersCubit()),
          BlocProvider<WordCubit>(
              create: (context) => WordCubit(
                    word: 'ANASTAZJA',
                    lettersCubit: context.read<LettersCubit>(),
                  ))
        ],
        child: Scaffold(
          body: Center(
            child: Column(children: [
              Image.asset(
                  width: double.infinity,
                  height: 200,
                  'assets/images/hangman.png'),
              Text('Category: $category'),
              BlocBuilder<WordCubit, WordState>(
                builder: (context, state) {
                  return Word(state.word, state.usedChars);
                },
              ),
              const Letters(),
              IconButton(
                  iconSize: 35,
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ]),
          ),
        ));
  }
}
