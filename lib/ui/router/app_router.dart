import 'package:flutter/material.dart';
import 'package:hangman/ui/constants/routes.dart';
import 'package:hangman/ui/pages/categories.dart';
import 'package:hangman/ui/pages/game.dart';
import 'package:hangman/ui/pages/home.dart';
import 'package:hangman/ui/router/custom_page_route.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const Home(),
        );
      case Routes.categories:
        return CustomPageRoute(child: const Categories(), settings: settings);
      case Routes.game:
        return CustomPageRoute(
            child: Game(category: settings.arguments.toString()),
            settings: settings);
      case Routes.inWork:
        return MaterialPageRoute(
          builder: (_) => const Text("In Work"),
        );
      default:
        return null;
    }
  }
}
