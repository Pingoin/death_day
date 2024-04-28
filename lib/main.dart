import 'package:death_day/model/user.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:death_day/ui/my_home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Death Day',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  var favorites = <WordPair>[];
  var users = <User>[];

  void toggleFavorite() {
      users.add(User());
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}
