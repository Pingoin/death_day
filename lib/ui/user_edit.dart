import 'package:death_day/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserEdit extends StatelessWidget {
  const UserEdit({super.key});

@override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var appState = context.watch<MyAppState>();
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Column(
      children: [
        Card(
          color: theme.colorScheme.primary,
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Edit"+appState.currentUser.toString(),
              style: style,
            ),
          ),
        ),
      ],
    );
  }
}