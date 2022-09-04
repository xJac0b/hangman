import 'package:flutter/material.dart';
import 'package:hangman/ui/constants/categories.dart';
import 'package:hangman/ui/constants/routes.dart';
import 'package:hangman/ui/widgets/menu_button.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Categories', style: TextStyle(fontSize: 60)),
          Column(children: const [
            MenuButton(
                label: Category.all, route: Routes.newGame, color: Colors.blue),
            MenuButton(
                label: Category.geography,
                route: Routes.newGame,
                color: Colors.green),
            MenuButton(
                label: Category.food,
                route: Routes.newGame,
                color: Colors.yellow),
            MenuButton(
                label: Category.cinema,
                route: Routes.newGame,
                color: Colors.orange),
            MenuButton(
                label: Category.sport,
                route: Routes.newGame,
                color: Colors.red),
            MenuButton(
                label: Category.music,
                route: Routes.newGame,
                color: Colors.pink),
            MenuButton(
                label: Category.animals,
                route: Routes.newGame,
                color: Colors.purple),
          ]),
          IconButton(
              iconSize: 35,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    ));
  }
}
