import 'package:flutter/material.dart';
import 'package:hangman/logic/cubits/hangman/hangman_cubit.dart';
import 'package:hangman/ui/constants/routes.dart';

class DialogBox extends StatelessWidget {
  final String category;
  final HangmanStatus status;
  const DialogBox(this.category, this.status, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(color: Colors.black)),
            alignment: Alignment.center,
            width: 200,
            height: 100,
            //color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1!.color),
                    textAlign: TextAlign.center,
                    status == HangmanStatus.win ? "WIN" : "GAME OVER"),
                IconButton(
                    iconSize: 35,
                    icon: const Icon(Icons.replay),
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, Routes.game,
                        arguments: category)),
              ],
            )));
  }
}
