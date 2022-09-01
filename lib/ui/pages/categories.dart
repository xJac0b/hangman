import 'package:flutter/material.dart';
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
            MenuButton(label: 'All', route: Routes.game, color: Colors.blue),
            MenuButton(
                label: 'Geography', route: Routes.game, color: Colors.green),
            MenuButton(label: 'Food', route: Routes.game, color: Colors.yellow),
            MenuButton(
                label: 'Cinema', route: Routes.game, color: Colors.orange),
            MenuButton(label: 'Sport', route: Routes.game, color: Colors.red),
            MenuButton(label: 'Music', route: Routes.game, color: Colors.pink),
            MenuButton(
                label: 'Animals', route: Routes.game, color: Colors.purple),
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
