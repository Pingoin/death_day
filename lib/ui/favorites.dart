import 'package:flutter/material.dart';
import 'package:death_day/main.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pairs = appState.favorites;

    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favorites yet.'),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text('You have '
                '${appState.favorites.length} favorites:'),
          ),
          for (var pair in pairs)
            ListTile(
              leading: const Icon(Icons.favorite),
              title: Text(pair.asCamelCase),
            ),
        ],
      ),
    );
  }
}
