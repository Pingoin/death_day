import 'package:death_day/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {

    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context);

    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return ListView(
      children: [
        Card(
          elevation: 5.0,
          color: theme.colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              style: style,
              "App Version: ${appState.version}"),
          ),
        ),
                Card(
          elevation: 5.0,
          color: theme.colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              style: style,
              "Build Number: ${appState.buildNumber}"),
          ),
        ),
      ],
    );
  }
}
