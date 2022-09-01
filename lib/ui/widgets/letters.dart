import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:hangman/ui/widgets/letter.dart';

class Letters extends StatelessWidget {
  const Letters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Letter('A'),
            Letter('Ą'),
            Letter('B'),
            Letter('C'),
            Letter('Ć'),
            Letter('D'),
            Letter('E')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Letter('Ę'),
            Letter('F'),
            Letter('G'),
            Letter('H'),
            Letter('I'),
            Letter('J'),
            Letter('K'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Letter('L'),
            Letter('Ł'),
            Letter('M'),
            Letter('N'),
            Letter('Ń'),
            Letter('O'),
            Letter('Ó'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Letter('P'),
            Letter('Q'),
            Letter('R'),
            Letter('S'),
            Letter('Ś'),
            Letter('T'),
            Letter('U'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Letter('V'),
            Letter('W'),
            Letter('X'),
            Letter('Y'),
            Letter('Z'),
            Letter('Ż'),
            Letter('Ż'),
          ],
        )
      ],
    );
  }
}
