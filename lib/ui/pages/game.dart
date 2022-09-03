import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/logic/cubits/hangman/hangman_cubit.dart';
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
                    word: 'ANA  STAZJA',
                    lettersCubit: context.read<LettersCubit>(),
                  )),
          BlocProvider<HangmanCubit>(
              create: (context) =>
                  HangmanCubit(wordCubit: context.read<WordCubit>())),
        ],
        child: Scaffold(
          body: Center(
            child: BlocBuilder<HangmanCubit, HangmanState>(
              builder: (context, state) {
                if (state.status == HangmanStatus.inGame) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        state.level > -1
                            ? Image.asset(
                                width: double.infinity,
                                height: 200,
                                'assets/images/${state.level}.png')
                            : const SizedBox(height: 200),
                        Text('Category: $category'),
                        BlocBuilder<WordCubit, WordState>(
                          builder: (context, state) {
                            return Word(state.word, state.usedChars);
                          },
                        ),
                        const Letters(),
                        IconButton(
                            iconSize: 35,
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ]);
                } else if (state.status == HangmanStatus.win) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text('win'),
                        IconButton(
                            iconSize: 35,
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ]);
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('game over'),
                    IconButton(
                        iconSize: 35,
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
