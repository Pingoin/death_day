import 'dart:async';
import 'package:death_day/app_state.dart';
import 'package:death_day/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:death_day/ui/layout.dart';
import 'package:provider/provider.dart';
import './l10n/gen_l10n/app_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(MobileAds.instance.initialize());
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
        theme: const DeathDayTheme(TextTheme()).dark(),
        home: const AppLayout(),
      ),
    );
  }
}
