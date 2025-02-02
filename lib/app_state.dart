import 'dart:convert';
import 'package:death_day/model/user.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppState extends ChangeNotifier {
  var users = <User>[];
  int currentUser = 0;

  bool editActive = false;
  bool newUser=false;

  String appName = "";
  String packageName = "";
  String version = "";
  String buildNumber = "";

  String get usersString {
    return jsonEncode(users);
  }

  MyAppState() {
    WidgetsFlutterBinding.ensureInitialized();
    // ignore: invalid_use_of_visible_for_testing_member
    PackageInfo.fromPlatform().then((packageInfo) {
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
      notifyListeners();
    });
    loadData();
  }

  void saveData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("users", usersString);
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var savedData = prefs.getString("users");
    if (savedData != null) {
      List<dynamic> data = jsonDecode(savedData);

      for (dynamic element in data) {
        users.add(User.fromJson(element));
      }
    }

    if (users.isNotEmpty){
      currentUser=0;
      editActive=false;
    }
    notifyListeners();
  }

  void selectUser(int user) {
    currentUser = user;
    notifyListeners();
  }

  void addUser(User user) {
    users.add(user);
    currentUser = users.length - 1;
    newUser = true;
    saveData();
    notifyListeners();
  }

  void removeUser(int user) {
    users.removeAt(user);
    saveData();
    notifyListeners();
  }

  void setEdit(bool edit) {
    editActive = edit;
    if (edit==false){
      newUser=false;
    }
    saveData();
    notifyListeners();
  }

  bool isInUserRange(int value) {
    return (value >= 0 && value < users.length);
  }
}
