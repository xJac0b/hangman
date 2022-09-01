import 'package:flutter/material.dart';
import 'package:hangman/ui/widgets/letters.dart';
import 'package:hangman/ui/widgets/word.dart';

class Game extends StatelessWidget {
  final String category;
  const Game({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: [
        Image.asset(
            width: double.infinity, height: 200, 'assets/images/hangman.png'),
        Text('Category: $category'),
        const Word('jabako', {'j', 'a'}),
        const Letters(),
        IconButton(
            iconSize: 35,
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ]),
    ));
  }
}
