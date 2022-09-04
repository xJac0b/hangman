import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/logic/cubits/hangman/hangman_cubit.dart';
import 'package:hangman/logic/cubits/letters/letters_cubit.dart';
import 'package:hangman/logic/cubits/word/word_cubit.dart';
import 'package:hangman/ui/constants/routes.dart';
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
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          border:
                                              Border.all(color: Colors.black)),
                                      alignment: Alignment.center,
                                      width: 200,
                                      height: 100,
                                      //color: Theme.of(context).primaryColor,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .color),
                                              textAlign: TextAlign.center,
                                              "${state.status == HangmanStatus.win ? "WIN" : "GAME OVER"}"),
                                          IconButton(
                                              iconSize: 35,
                                              icon: const Icon(Icons.replay),
                                              onPressed: () => Navigator
                                                  .pushReplacementNamed(
                                                      context, Routes.game,
                                                      arguments: category)),
                                        ],
                                      )))
                              : SizedBox(),
                        ],
                      ),
                      IconButton(
                          iconSize: 35,
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                    ]);
              },
            ),
          ),
        ));
  }
}
