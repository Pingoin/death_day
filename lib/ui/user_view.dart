import 'package:death_day/main.dart';
import 'package:death_day/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var appState = context.watch<MyAppState>();

    User user;

    if (appState.currentUser >= 0) {
      user = appState.users[appState.currentUser];
    } else {
      user = User();
    }

    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: theme.colorScheme.primary,
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              user.name,
              style: style,
            ),
          ),
        ),
        Card(
          color: theme.colorScheme.primary,
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              AppLocalizations.of(context)!.birth_date(user.birhDate),
              style: style,
            ),
          ),
        ),
        Card(
          color: theme.colorScheme.primary,
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              AppLocalizations.of(context)!.birth_time(user.birhDate),
              style: style,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            appState.setEdit(true);
          },
          child: Text(AppLocalizations.of(context)!.edit),
        ),
      ],
    );
  }
}
