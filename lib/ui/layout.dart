import 'package:death_day/app_state.dart';
import 'package:death_day/ui/about_page.dart';
import 'package:death_day/ui/user_edit.dart';
import 'package:death_day/ui/user_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/gen_l10n/app_localizations.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    var appState = context.watch<MyAppState>();

    if (selectedIndex > appState.users.length) {
      page = const AboutPage();
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

  SingleChildScrollView navigation(
      BoxConstraints constraints, MyAppState appState) {
    final theme = Theme.of(context);
    final style = theme.textTheme.labelSmall!.copyWith(
      color: theme.colorScheme.tertiary,
    );
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                unselectedLabelTextStyle: style,
                destinations: [
                  for (var user in appState.users)
                    NavigationRailDestination(
                      icon: const Icon(Icons.face),
                      label: Text(user.name),
                    ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.add_circle_outline),
                    label: Text(AppLocalizations.of(context).new_user),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.home_filled),
                    label: Text(AppLocalizations.of(context).about_page),
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
              ),
            )
        )
    );
  }
}
