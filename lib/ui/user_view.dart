import 'dart:async';

import 'package:death_day/app_state.dart';
import 'package:death_day/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/gen_l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
        MyBannerAdWidget(),
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

class MyBannerAdWidget extends StatefulWidget {
  /// The requested size of the banner. Defaults to [AdSize.banner].
  final AdSize adSize;

  /// The AdMob ad unit to show.
  ///
  /// TODO: replace this test ad unit with your own ad unit
  final String adUnitId = 'ca-app-pub-1419955128907933~5126146979';

  MyBannerAdWidget({
    super.key,
    this.adSize = AdSize.banner,
  });

  @override
  State<MyBannerAdWidget> createState() => _MyBannerAdWidgetState();
}

class _MyBannerAdWidgetState extends State<MyBannerAdWidget> {
  /// The banner ad to show. This is `null` until the ad is actually loaded.
  BannerAd? _bannerAd;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: widget.adSize.width.toDouble(),
        height: widget.adSize.height.toDouble(),
        child: _bannerAd == null
            // Nothing to render yet.
            ? SizedBox()
            // The actual ad.
            : AdWidget(ad: _bannerAd!),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  /// Loads a banner ad.
  void _loadAd() {
    final bannerAd = BannerAd(
      size: widget.adSize,
      adUnitId: widget.adUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, error) {
          debugPrint('BannerAd failed to load: $error');
          ad.dispose();
        },
      ),
    );

    // Start loading.
    bannerAd.load();
  }
}
