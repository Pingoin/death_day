import 'package:death_day/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {

    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);

    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Column(
      children: [
        Card(
          elevation: 5.0,
          color: theme.colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              style: style,
              "${appState.usersString}\n${appState.appName}\n${appState.packageName}\n${appState.version}\n${appState.buildNumber}"),
          ),
        ),
      ],
    );
  }
}
