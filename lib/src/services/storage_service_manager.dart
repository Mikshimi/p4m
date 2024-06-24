import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:msgpack_dart/msgpack_dart.dart';
import '../app_config.dart';
import 'path_provider_service.dart';
import '../models/prayer.dart';

class StorageServiceManager {
  final PathProviderService pathProviderService;

  StorageServiceManager(this.pathProviderService);

  Future<void> saveLibrary(List<Prayer> prayers, String libraryName) async {
    final path = await pathProviderService.getLibraryPath();
    // ignore: prefer_const_declarations
    final extension =
        kIsWeb ? AppConfig.webExtension : AppConfig.mobileExtension;
    final filePath = '$path/$libraryName.$extension'.replaceAll('\\', '/');

    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = jsonEncode(prayers.map((p) => p.toJson()).toList());
      await prefs.setString(filePath, jsonString);
    } else {
      final bytes = serialize(prayers.map((p) => p.toMap()).toList());
      final file = File(filePath);
      await file.writeAsBytes(bytes);
    }
  }

  Future<List<Prayer>> loadLibrary(String libraryName) async {
    final path = await pathProviderService.getLibraryPath();
    // ignore: prefer_const_declarations
    final extension =
        kIsWeb ? AppConfig.webExtension : AppConfig.mobileExtension;
    final filePath = '$path/$libraryName.$extension'.replaceAll('\\', '/');

    if (kIsWeb) {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey(filePath)) {
        final jsonString = prefs.getString(filePath)!;
        final List<dynamic> jsonList = jsonDecode(jsonString);
        return jsonList.map((json) => Prayer.fromJson(json)).toList();
      } else {
        throw Exception('Library not found');
      }
    } else {
      final file = File(filePath);
      if (await file.exists()) {
        final bytes = await file.readAsBytes();
        final List<dynamic> dataList = deserialize(bytes);
        return dataList.map((data) {
          // Convert Map<dynamic, dynamic> to Map<String, dynamic>
          final convertedMap = (data as Map)
              .map((key, value) => MapEntry(key.toString(), value));
          return Prayer.fromMap(convertedMap);
        }).toList();
      } else {
        throw Exception('Library not found');
      }
    }
  }
}
