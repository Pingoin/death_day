import 'package:death_day/l10n/gen_l10n/app_localizations.dart';
import 'package:death_day/model/user.dart';
import 'package:death_day/ui/about_page.dart';
import 'package:death_day/ui/user_edit.dart';
import 'package:death_day/ui/user_view.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAppState extends ChangeNotifier {
  Future<Database>? database;
  String appName = "";
  String packageName = "";
  String version = "";
  String buildNumber = "";
  List<NavItem> navItems = [];
  List<NavItem> baseNavItems = [];
  Widget page = UserEdit(null);

  MyAppState() {
    baseNavItems = [
      NavItem(
        icon: const Icon(Icons.add_circle_outline),
        label: (context) => Text(AppLocalizations.of(context).new_user),
        onClick: () => page = UserEdit(null),
      ),
      NavItem(
        icon: const Icon(Icons.home_filled),
        label: (context) => Text(AppLocalizations.of(context).about_page),
        onClick: () => page = AboutPage(),
      ),
      NavItem(
        icon: const ImageIcon(AssetImage('assets/bmc-logo-no-background.png')),
        label: (context) => Text(AppLocalizations.of(context).buymeacoffee),
        onClick: () {
          launchUrl(Uri.parse("https://www.buymeacoffee.com/pingoin"));
          page = AboutPage();
        },
      ),
    ];

    WidgetsFlutterBinding.ensureInitialized();

    getDatabasesPath().then((dbPath) {
      database = openDatabase(
        join(dbPath, 'user_database.db'),
        onCreate: (db, version) {
          // Run the CREATE TABLE statement on the database.
          return db.execute(
            '''
              CREATE TABLE users (
                id TEXT PRIMARY KEY,
                name TEXT NOT NULL,
                gender INTEGER NOT NULL,
                birthDate TEXT NOT NULL
              )
            ''',
          );
        },
        version: 1,
      );
    });
    // ignore: invalid_use_of_visible_for_testing_member
    PackageInfo.fromPlatform().then((packageInfo) {
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
      updateNavItems();
      notifyListeners();
    });
    
  }

  // Define a function that inserts users into the database
  Future<void> insertUser(User user) async {
    // Get a reference to the database.
    final db = await database;

    if (db != null) {
      await db.insert(
        'users',
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    updateNavItems();
  }

  Future<User?> getUser(String id) async {
    // Get a reference to the database.
    final db = await database!;

    // Query the table for the user with the given id.
    final List<Map<String, Object?>>? userMap = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );

    // If no user was found, return null
    if (userMap == null || userMap.isEmpty) {
      return null;
    }
    // Convert the user's fields into a `User` object.
    return User.fromMap(userMap[0]);
  }

  // A method that retrieves all the users from the users table.
  Future<List<User>> users() async {
    // Get a reference to the database.
    final db = await database!;

    // Query the table for all the users.
    final List<Map<String, Object?>> userMaps = await db.query('users');

    // Convert the list of each user's fields into a list of `User` objects.
    return [
      for (final map in userMaps) User.fromMap(map),
    ];
  }

  Future<void> updateUser(User user) async {
    // Get a reference to the database.
    final db = await database!;

    // Update the given User.
    await db.update(
      'users',
      user.toMap(),
      // Ensure that the User has a matching id.
      where: 'id = ?',
      // Pass the User's id as a whereArg to prevent SQL injection.
      whereArgs: [user.id],
    );
    updateNavItems();
  }

  Future<void> deleteUser(User user) async {
    // Get a reference to the database.
    final db = await database!;

    // Remove the User from the database.
    await db.delete(
      'users',
      // Use a `where` clause to delete a specific user.
      where: 'id = ?',
      // Pass the User's id as a whereArg to prevent SQL injection.
      whereArgs: [user.id],
    );
    updateNavItems();
  }

  void addUser(User user) async {
    await insertUser(user);
    notifyListeners();
  }

  void removeUser(User user) async {
    await deleteUser(user);
    notifyListeners();
  }

  Future<bool> isInUserRange(int value) async {
    return (value >= 0 && value < (await users()).length);
  }

  Widget getPage() {
    return page;
  }

  List<NavigationRailDestination> getNavItems(BuildContext context) {
    return navItems.map((item) => item.getNavView(context)).toList();
  }

  void setViewUser(String user) {
    page = UserView(user);
    notifyListeners();
  }

  void setEditUser(String? user) {
    page = UserEdit(user);
    notifyListeners();
  }

  void setViewAbout() {
    page = AboutPage();
    notifyListeners();
  }

  void clickNavItem(int index) {
    navItems[index].onClick();
  }

  void updateNavItems() async{
    final db = await database;

    navItems=[];
    navItems.addAll(baseNavItems);

    if (db!= null) {
      navItems = (await users()).map((user) => NavItem(
        icon: const Icon(Icons.person),
        label: (context) => Text(user.name),
        onClick: () => setViewUser(user.id),
      )).toList();
      navItems.addAll(baseNavItems);
      notifyListeners();
    }

  }
}

class NavItem {
  Widget icon;
  Function(BuildContext context) label;
  Function onClick;

  NavItem({required this.icon, required this.label, required this.onClick});
  NavigationRailDestination getNavView(BuildContext context) {
    return NavigationRailDestination(
      icon: icon,
      label: label(context),
    );
  }
}
