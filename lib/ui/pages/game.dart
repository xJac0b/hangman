import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/logic/cubits/hangman/hangman_cubit.dart';
import 'package:hangman/logic/cubits/letters/letters_cubit.dart';
import 'package:hangman/logic/cubits/word/word_cubit.dart';
import 'package:hangman/ui/widgets/dialog_box.dart';
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
                    category: category,
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
                return OrientationBuilder(builder: (context, orientation) {
                  if (orientation == Orientation.portrait) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          state.level > -1
                              ? Image.asset(
                                  width: double.infinity,
                                  height: 200,
                                  'assets/images/${state.level > 9 ? '9' : '${state.level}'}.png')
                              : const SizedBox(height: 200),
                          Text('Category: $category'),
                          BlocBuilder<WordCubit, WordState>(
                            builder: (context, wordState) {
                              return state.status == HangmanStatus.gameOver
                                  ? Word.gameOver(wordState.word)
                                  : Word(wordState.word, wordState.usedChars);
                            },
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              state.status == HangmanStatus.inGame
                                  ? const Letters()
                                  : const Letters(disabled: true),
                              state.status != HangmanStatus.inGame
                                  ? DialogBox(category, state.status)
                                  : const SizedBox(),
                            ],
                          ),
                          IconButton(
                              iconSize: 35,
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ]);
                  } else {
                    return Row(children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                            iconSize: 35,
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    state.level > -1
                                        ? Image.asset(
                                            width: 200,
                                            height: 200,
                                            'assets/images/${state.level > 9 ? '9' : '${state.level}'}.png')
                                        : const SizedBox(
                                            width: 200, height: 200),
                                    Text('Category: $category'),
                                    BlocBuilder<WordCubit, WordState>(
                                      builder: (context, wordState) {
                                        return state.status ==
                                                HangmanStatus.gameOver
                                            ? Word.gameOver(wordState.word)
                                            : Word(wordState.word,
                                                wordState.usedChars);
                                      },
                                    ),
                                  ]),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        state.status == HangmanStatus.inGame
                                            ? const Letters()
                                            : const Letters(disabled: true),
                                        state.status != HangmanStatus.inGame
                                            ? DialogBox(category, state.status)
                                            : const SizedBox(),
                                      ],
                                    ),
                                  ]),
                            ]),
                      )
                    ]);
                  }
                });
              },
            ),
          ),
        ));
  }
}
