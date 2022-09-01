import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Word extends StatelessWidget {
  final String word;
  final Set<String> letters;
  const Word(this.word, this.letters, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (var i in word.characters)
        Container(
          constraints: const BoxConstraints(
              minWidth: 20, minHeight: 20, maxWidth: 20, maxHeight: 20),
          margin: const EdgeInsets.all(5.0),
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(width: 3.0))),
          child: letters.contains(i) ? Center(child: Text(i)) : const Text(''),
        ),
    ]);
  }
}
