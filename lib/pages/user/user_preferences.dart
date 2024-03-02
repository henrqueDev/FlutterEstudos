import 'package:flutter/material.dart';
import 'package:hello_howrld/pages/app/app_controller.dart';
import 'package:logger/logger.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  State<CustomSwitch> createState() {
    return CustomSwitchState();
  }
}

class CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(children: [
      const Padding(padding: EdgeInsets.all(4.0)),
      const Icon(Icons.dark_mode),
      Switch(
          value: AppController.instance.isDarkTheme,
          onChanged: (value) {
            setState(() {
              AppController.instance.changeTheme();

              var logger = Logger();

              logger.log(Level.trace, AppController.instance.isDarkTheme);
            });
          }),
      const Padding(padding: EdgeInsets.all(2.0)),
    ]));
  }
}

class UserPreferences extends StatefulWidget {
  const UserPreferences({super.key});

  @override
  State<UserPreferences> createState() => _UserPreferencesState();
}

class _UserPreferencesState extends State<UserPreferences> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Preferences')),
        body: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [CustomSwitch()]));
  }
}
