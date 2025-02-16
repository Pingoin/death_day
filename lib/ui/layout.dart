import 'package:death_day/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    page = appState.getPage(); 
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
              destinations: appState.getNavItems(context),
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                  appState.clickNavItem(value);
                });
              },
            ),
          ),
        ));
  }
}


