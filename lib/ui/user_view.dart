import 'dart:async';

import 'package:death_day/app_state.dart';
import 'package:death_day/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/gen_l10n/app_localizations.dart';

class UserView extends StatefulWidget {
  const UserView(this.id, {super.key});
  final String id;

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  var active = false;
  User user = defaultUser();
  @override
  void initState() {
    super.initState();
    active = true;
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
    appState.getUser(widget.id).then((newUser) {
      if (newUser != null) {
        if (user.id != newUser.id) {
          setState(() {
            user = newUser;
          });
        }
      }
    });

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
            appState.setEditUser(user.id);
          },
          child: Text(AppLocalizations.of(context).edit),
        ),
      ],
    );
  }
}
