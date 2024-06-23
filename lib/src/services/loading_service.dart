import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/prayer.dart';
import 'path_provider_service.dart';
import 'storage_service_manager.dart';

class LoadingService {
  final PathProviderService pathProviderService;
  final StorageServiceManager storageServiceManager;

  LoadingService(this.pathProviderService)
      : storageServiceManager = StorageServiceManager(pathProviderService);

  Future<void> loadUserData() async {
    // Load user data from shared preferences or other storage
  }

  Future<void> loadPrayerLibrary(String libraryName, {String lengthCategory = 'short'}) async {
    final path = await pathProviderService.getLibraryPath();
    String selectedLibrary = libraryName;
    final seedFilePath = '$path/$selectedLibrary.txt';
    final seedFile = File(seedFilePath);

    if (await seedFile.exists()) {
      final rawText = await seedFile.readAsString();
      final segments = rawText.split(RegExp(r'\r?\n(short|medium|long)\r?\n'));
      final prayers = <Prayer>[];

      int categoryIndex = ['short', 'medium', 'long'].indexOf(lengthCategory);
      if (categoryIndex == -1 || categoryIndex >= segments.length) {
        throw Exception('Invalid prayer length category');
      }

      final lines = segments[categoryIndex + 1].split('\n');
      for (var line in lines) {
        final parts = line.split('#%*&');
        if (parts.length >= 8) {
          final prayerCode = generatePrayerCode(parts);
          final prayer = Prayer.fromRawText(line, prayerCode);
          prayers.add(prayer);
        }
      }

      await storageServiceManager.saveLibrary(prayers, libraryName);
    } else {
      throw Exception('Library seed file not found');
    }
  }

  String generatePrayerCode(List<String> parts) {
    final category = parts[1].substring(0, 3);
    final subCategory = parts[2].substring(0, 3);
    final title = parts[0].substring(0, 3);
    final numericalOrder = parts[2].length; // Simplified for this example
    return '$category$subCategory$title$numericalOrder';
  }
}
