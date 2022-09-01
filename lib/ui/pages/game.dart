import 'package:flutter/material.dart';

class Game extends StatelessWidget {
  final String category;
  const Game({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(children: [
        Text(category),
        IconButton(
            iconSize: 35,
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ]),
    ));
  }
}
