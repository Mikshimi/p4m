import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:msgpack_dart/msgpack_dart.dart';
import 'path_provider_service.dart';
import '../models/prayer.dart';

class StorageServiceManager {
  final PathProviderService pathProviderService;

  StorageServiceManager(this.pathProviderService);

  Future<void> saveLibrary(List<Prayer> prayers, String libraryName) async {
    final path = await pathProviderService.getLibraryPath();
    final filePath = '$path/$libraryName.${kIsWeb ? 'json' : 'msgpack'}';

    if (kIsWeb) {
      final jsonString = jsonEncode(prayers.map((p) => p.toJson()).toList());
      final file = File(filePath);
      await file.writeAsString(jsonString);
    } else {
      final bytes = serialize(prayers.map((p) => p.toMap()).toList());
      final file = File(filePath);
      await file.writeAsBytes(bytes);
    }
  }

  Future<List<Prayer>> loadLibrary(String libraryName) async {
    final path = await pathProviderService.getLibraryPath();
    final filePath = '$path/$libraryName.${kIsWeb ? 'json' : 'msgpack'}';
    final file = File(filePath);

    if (await file.exists()) {
      if (kIsWeb) {
        final jsonString = await file.readAsString();
        final List<dynamic> jsonList = jsonDecode(jsonString);
        return jsonList.map((json) => Prayer.fromJson(json)).toList();
      } else {
        final bytes = await file.readAsBytes();
        final List<dynamic> dataList = deserialize(bytes);
        return dataList.map((data) => Prayer.fromMap(data)).toList();
      }
    } else {
      throw Exception('Library not found');
    }
  }
}
