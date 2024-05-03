import 'package:death_day/main.dart';
import 'package:death_day/model/user.dart';
import 'package:death_day/ui/helper/show_date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserEdit extends StatefulWidget {
  const UserEdit({super.key});

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  final nameController = TextEditingController();
  User user = User();
  String buttonText = "";
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    super.dispose();
  }

  void _updateName() {
    user.name = nameController.text;
  }

  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    nameController.addListener(_updateName);
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    setState(() {
      if (appState.isInUserRange(appState.currentUser)) {
        user = appState.users[appState.currentUser];
        buttonText = AppLocalizations.of(context)!.update_user;
        nameController.text=user.name;
      } else {
        user = User();
        buttonText = AppLocalizations.of(context)!.add_user;
      }
    });

    return Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: AppLocalizations.of(context)!.user_name_input,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showDateTimePicker(context: context, lastDate: DateTime.now())
                .then((value) => {
                      if (value != null) {user.birhDate = value}
                    });
          },
          child: Text(AppLocalizations.of(context)!.set_birthday),
        ),
        ElevatedButton(
          onPressed: () {
            if (!appState.isInUserRange(appState.currentUser)) {
              appState.users.add(user);
              appState.selectUser(appState.users.length - 1);
            }
            appState.setEdit(false);
          },
          child: Text(buttonText),
        ),
      ],
    );
  }
}
