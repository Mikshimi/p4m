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
                value: themeChange("America"),
                child: const Text('America'),
              ),
              DropdownMenuItem(
                value: themeChange("Delux"),
                child: const Text('Delux'),
              ),
              DropdownMenuItem(
                value: themeChange("The_Ocean"),
                child: const Text('The Ocean'),
              ),
              DropdownMenuItem(
                value: themeChange("Natures_Call"),
                child: const Text("Nature's Call"),
              ),
              DropdownMenuItem(
                value: themeChange("Whisper"),
                child: const Text('Whisper'),
              ),
              DropdownMenuItem(
                value: themeChange("Authors_Notes"),
                child: const Text("Author's Notes"),
              ),
            ],
          )),
    );
  }
}
