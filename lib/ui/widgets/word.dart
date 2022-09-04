import 'package:flutter/widgets.dart';

class Word extends StatelessWidget {
  final String word;
  late final Set<String> letters;
  Word(this.word, this.letters, {Key? key}) : super(key: key);
  Word.gameOver(this.word, {Key? key}) : super(key: key) {
    letters = word.characters.toSet();
  }
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (var i in word.characters)
        i == ' '
            ? SizedBox(width: 20)
            : Container(
                constraints: const BoxConstraints(
                    minWidth: 20, minHeight: 20, maxWidth: 20, maxHeight: 20),
                margin: const EdgeInsets.all(5.0),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(width: 3.0))),
                child: letters.contains(i)
                    ? Center(child: Text(i))
                    : const Text(''),
              ),
    ]);
  }
}
