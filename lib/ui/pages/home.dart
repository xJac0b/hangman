import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangman/logic/cubits/theme/theme_cubit.dart';
import 'package:hangman/ui/constants/routes.dart';
import 'package:hangman/ui/widgets/app_bar.dart';
import 'package:hangman/ui/widgets/menu_button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Hangman', style: TextStyle(fontSize: 60)),
          Column(children: const [
            MenuButton(label: '1 player', route: Routes.categories),
            SizedBox(height: 10),
            MenuButton(label: '2 players', route: Routes.inWork),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) => IconButton(
                  iconSize: 35,
                  icon: Icon(
                    state.themeMode == ThemeMode.light
                        ? Icons.sunny
                        : Icons.mode_night,
                  ),
                  onPressed:
                      BlocProvider.of<ThemeCubit>(context).updateAppTheme),
            ),
            IconButton(
                iconSize: 35,
                icon: Icon(
                  Icons.star,
                ),
                onPressed: () {
                  print('link to App store');
                }),
          ])
        ],
      ),
    ));
  }
}
