import 'package:death_day/model/user.dart';
import 'package:flutter/material.dart';
import 'package:death_day/ui/main_element.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Death Day',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        ),
        home: const MainElement(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var users = <User>[];
  int currentUser = -1;

  bool editActive = false;

  MyAppState() {
    users.add(User());
    users.add(User());
    users.add(User());
    users.add(User());
  }
  void selectUser(int user) {
    currentUser = user;
    notifyListeners();
  }

  void setEdit(bool edit) {
    editActive = edit;
    notifyListeners();
  }
}
