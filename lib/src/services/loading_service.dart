// ignore: unused_import
import 'package:flutter/material.dart';

class LoadingService {
  Future<void> loadUserData() async {
    // Simulate loading user data
    await Future.delayed(const Duration(seconds: 2));
  }

  Future<void> loadPrayerLibrary() async {
    // Simulate loading prayer library
    await Future.delayed(const Duration(seconds: 2));
  }
}
