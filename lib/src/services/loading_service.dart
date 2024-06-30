import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/prayer_data.dart';
import '../models/prayer.dart';

class LoadingService {
  LoadingService();

  int counter = 0; // used for testing purposes.

  Future<void> loadUserPrayerData() async {
    // TODO: Implement user prayer data loading logic
  }

  Future<List<Prayer>> loadPrayerLibrary(String libraryName, String prayerSize) async {
    final prefs = await SharedPreferences.getInstance();
    return _loadLibraryWithDefaults(prefs, libraryName, prayerSize);
  }

  Future<List<Prayer>> onlyLoadUserLibrary(String libraryName) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(libraryName)) {
      return _loadUserLibrary(prefs, libraryName);
    } else {
      return <Prayer>[];
    }
  }

  List<Prayer> _loadLibraryWithDefaults(SharedPreferences prefs, String libraryName, String prayerSize) {
    if (prefs.containsKey(libraryName) && libraryName != 'p4m_library_seed') {
      final jsonString = prefs.getString(libraryName)!;
      final List<dynamic> jsonList = jsonDecode(jsonString);
      List<Prayer> prayers = _loadDefaultPrayers(prayerSize);
      return prayers + jsonList.map((json) => Prayer.fromJson(json)).toList();
    } else {
      return _loadDefaultPrayers(prayerSize);
    }
  }

  List<Prayer> _loadDefaultPrayers(String prayerSize) {
    final rawText = PrayerData.getPrayers(prayerSize).join('\n');
    final segments = rawText.split(RegExp(r'\r?\n(short|medium|long)\r?\n'));
    final prayers = <Prayer>[];

    int prayerSizeIndex = ['short', 'medium', 'long', 'all'].indexOf(prayerSize);
    if (prayerSizeIndex == -1 || prayerSizeIndex >= segments.length) {
      throw Exception('Invalid prayer size category');
    }

    final lines = segments[prayerSizeIndex].split('\n');
    for (var line in lines) {
      final parts = line.split('#%*&');
      if (parts.length >= 8) {
        counter++; //each prayer loaded should have a unique number, (temp)
        final prayerCode = _generatePrayerCode(parts);
        final prayer = Prayer.fromRawText(line, prayerCode);
        prayers.add(prayer);
      }
    }
    return prayers;
  }

  String _generatePrayerCode(List<String> parts) {
    final category = parts[1].substring(0, 3);
    final subCategory = parts[2].substring(0, 3);
    final title = parts[0].substring(0, 3);
    final numericalOrder = counter;
    return '$category$subCategory$title$numericalOrder';
  }

  Future<void> saveCreatedLibrary(String libraryName, List<Prayer> prayers) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(libraryName) && libraryName != 'p4m_library_seed') {
      await _modifyCreatedLibrary(prefs, libraryName, prayers);
    } else if (libraryName != 'p4m_library_seed') {
      final newLibrary = jsonEncode(prayers.map((p) => p.toJson()).toList());
      await prefs.setString(libraryName, newLibrary);
    }
  }

  Future<void> _modifyCreatedLibrary(SharedPreferences prefs, String libraryName, List<Prayer> prayers) async {
    final savedLibrary = prefs.getString(libraryName)!;
    final libraryNewAdditions = jsonEncode(prayers.map((p) => p.toJson()).toList());
    await prefs.setString(libraryName, savedLibrary + libraryNewAdditions);
  }

  List<Prayer> _loadUserLibrary(SharedPreferences prefs, String libraryName) {
    final jsonString = prefs.getString(libraryName)!;
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => Prayer.fromJson(json)).toList();
  }

  void logToConsoleInDebugMode(Prayer prayer, int counting) {
    if (kDebugMode) {
      print("Prayers added #: $counting");
      print("Prayer code: ${prayer.prayerCode}");
      print("Prayer category: ${prayer.category}");
      print("Prayer sub category: ${prayer.subCategory}");
      print("Prayer title: ${prayer.title}");
      print("Prayer description: ${prayer.description}");
      print("Prayer body: ${prayer.body}");
      print("Prayer faith: ${prayer.faith}");
      print("Prayer author: ${prayer.author}");
      print("Prayer date created: ${prayer.dateCreated}");
    }
  }
}
