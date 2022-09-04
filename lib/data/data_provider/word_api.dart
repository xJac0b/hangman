import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:hangman/ui/constants/categories.dart';

class WordAPI {
  Future<String> getWordByCategory(String category) async {
    final String response = await rootBundle.loadString('assets/words.json');
    final data = await json.decode(response);
    if (category == Category.all) {
      String rndCategory = data.keys.elementAt(Random().nextInt(data.length));
      return data[rndCategory][Random().nextInt(data[rndCategory].length)]
          .toUpperCase();
    }
    return data[category][Random().nextInt(data[category].length)]
        .toUpperCase();
  }
}
