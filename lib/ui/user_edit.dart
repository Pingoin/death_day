import 'package:death_day/app_state.dart';
import 'package:death_day/model/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../l10n/gen_l10n/app_localizations.dart';

class UserEdit extends StatefulWidget {
  const UserEdit(this.id, {super.key});

  final String? id;

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  final nameController = TextEditingController();
  User user = defaultUser();
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
    //var appState = context.watch<MyAppState>();
    buttonText = AppLocalizations.of(context).add_user;
    if (widget.id != null) {
      appState.getUser(widget.id!).then((newUser) {
        if (newUser != null) {
          if (user.id != newUser.id) {
            setState(() {
              user = newUser;
              nameController.text = user.name;
              buttonText = AppLocalizations.of(context).update_user;
            });
          }
        }
      });
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: AppLocalizations.of(context).user_name_input,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            showDatePicker(
                    context: context,
                    initialDate: user.birthDate,
                    lastDate: DateTime.now(),
                    firstDate: DateTime.now()
                        .subtract(const Duration(days: 365 * 130)))
                .then((value) => {
                      if (value != null)
                        {
                          setState(() {
                            user.birthDate = value;
                          })
                        }
                    });
          },
          child: Text(
            AppLocalizations.of(context).birth_date(user.birthDate),
          ),
        ),
        DropdownButton<Gender>(
            value: user.gender,
            onChanged: (Gender? newValue) {
              setState(() {
                user.gender = newValue!;
              });
            },
            items: Gender.values.map((Gender classType) {
              return DropdownMenuItem<Gender>(
                  value: classType,
                  child: Text(classType.toPrintString(context)));
            }).toList()),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                appState.removeUser(user);
                appState.setViewAbout(); // Navigate back to user list
              },
              child: Text(AppLocalizations.of(context).delete),
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.id == null) {
                  appState.addUser(user);
                } else {
                  appState.updateUser(user); // Update user
                }
                appState.setViewUser(user.id);
              },
              child: Text(buttonText),
            ),
          ],
        ),
      ],
    );
  }
}
