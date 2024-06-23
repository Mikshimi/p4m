import 'package:flutter/material.dart';
import 'dart:math';
import '../../services/loading_service.dart';
import '../../models/prayer.dart';
import '../../services/path_provider_service.dart';

class PrayerView extends StatefulWidget {
  const PrayerView({super.key});
  static const routeName = '/prayer_page';

  @override
  State<PrayerView> createState() => _PrayerViewState();
}

class _PrayerViewState extends State<PrayerView> {
  final LoadingService _loadingService = LoadingService(PathProviderService());
  List<Prayer> _prayers = [];
  String _selectedPrayer = '';

  @override
  void initState() {
    super.initState();
    _loadPrayers();
  }

  Future<void> _loadPrayers() async {
    await _loadingService.loadPrayerLibrary('p4m_library', lengthCategory: 'short');
    final prayers = await _loadingService.storageServiceManager.loadLibrary('p4m_library');
    setState(() {
      _prayers = prayers;
      _selectedPrayer = _prayers.isNotEmpty ? _getRandomPrayer() : 'No prayers available';
    });
  }

  String _getRandomPrayer() {
    final random = Random();
    final randomIndex = random.nextInt(_prayers.length);
    return _prayers[randomIndex].body;  // Assuming Prayer class has a 'body' field
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prayer View')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Text(_selectedPrayer),
        ),
      ),
    );
  }
}
