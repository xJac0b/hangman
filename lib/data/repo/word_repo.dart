import 'package:hangman/data/data_provider/word_api.dart';

class WordRepository {
  final WordAPI api = WordAPI();
  Future<String> getWordByCategory(String category) async {
    final String word = await api.getWordByCategory(category);
    return word;
  }
}
