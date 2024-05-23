import 'package:death_day/main.dart';
import 'package:death_day/ui/user_edit.dart';
import 'package:death_day/ui/user_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainElement extends StatefulWidget {
  const MainElement({super.key});

  @override
  State<MainElement> createState() => _MainElementState();
}

class _MainElementState extends State<MainElement> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    var appState = context.watch<MyAppState>();

    if (selectedIndex > appState.users.length) {
      page =        Card(
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(appState.usersString
            ),
          ),
        );
    } else if (appState.editActive ||
        !appState.isInUserRange(appState.currentUser)) {
      appState.editActive = true;
      page = const UserEdit();
    } else {
      page = const UserView();
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: navigation(constraints, appState),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }

  NavigationRail navigation(BoxConstraints constraints, MyAppState appState) {
    return NavigationRail(
      extended: constraints.maxWidth >= 600,
      destinations: [
        for (var user in appState.users)
          NavigationRailDestination(
            icon: const Icon(Icons.face),
            label: Text(user.name),
          ),
        NavigationRailDestination(
          icon: const Icon(Icons.add_circle_outline),
          label: Text(AppLocalizations.of(context)!.new_user),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.home_filled),
          label: Text(AppLocalizations.of(context)!.about_page),
        ),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        setState(() {
          selectedIndex = value;
          if (!appState.isInUserRange(selectedIndex)) {
            appState.selectUser(-1);
            appState.setEdit(true);
          } else {
            appState.selectUser(selectedIndex);
            appState.setEdit(false);
          }
        });
      },
    );
  }
}
