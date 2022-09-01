import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Letter extends StatelessWidget {
  final String character;
  const Letter(
    this.character, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(minimumSize: Size(40, 40)),
        child: Text(character));
  }
}
