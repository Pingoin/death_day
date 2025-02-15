import 'dart:async';

import 'package:death_day/app_state.dart';
import 'package:death_day/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/gen_l10n/app_localizations.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  var active = false;
  @override
  void initState() {
    super.initState();
    active = true;
    super.initState();
    Timer.periodic(const Duration(milliseconds: 100), (Timer t) {
      if (!active) {
        t.cancel();
      } else {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    active = false;
  }

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

    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return ListView(
      //mainAxisAlignment: MainAxisAlignment.center,
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
              AppLocalizations.of(context).time_left(user.timeLeft.inDays),
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
              AppLocalizations.of(context).time_of_death(user.deathTime),
              style: style,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            appState.setEdit(true);
          },
          child: Text(AppLocalizations.of(context).edit),
        ),
      ],
    );
  }
}
