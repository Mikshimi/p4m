import 'package:flutter/material.dart';
import '../../helpers/theme_constants.dart';
import '../../controllers/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adjust Your Settings'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: DropdownButton<ThemeData>(
            value: controller.themeData,
            onChanged: controller.updateThemeData,
            items: [
              DropdownMenuItem(
                value: themeChange("classicLight"),
                child: const Text('Classic Light'),
              ),
              DropdownMenuItem(
                value: themeChange("classicDark"),
                child: const Text('Classic Dark'),
              ),
              DropdownMenuItem(
                value: themeChange("cloud9"),
                child: const Text('Day Break'),
              ),
              DropdownMenuItem(
                value: themeChange("summer"),
                child: const Text('Hot Summer'),
              ),
              DropdownMenuItem(
                value: themeChange("autumn"),
                child: const Text('Autumn Dawn'),
              ),
              DropdownMenuItem(
                value: themeChange("dusk"),
                child: const Text('Dusk Night'),
              ),
              DropdownMenuItem(
                value: themeChange("midnight"),
                child: const Text('NewYork Night'),
              ),
              DropdownMenuItem(
                value: themeChange("winter"),
                child: const Text('Winter Night'),
              ),
            ],
          )),
    );
  }
}
