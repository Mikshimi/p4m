// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:pray_for_me/src/global_widgets/alert_service.dart';
import '../../models/prayer.dart';
import '../../p4m_app.dart';
import '../../services/storage_service.dart';

class PrayerPage extends StatefulWidget {
  const PrayerPage({super.key});
  static const routeName = '/prayer';

  @override
  _PrayerPageState createState() => _PrayerPageState();
}

class _PrayerPageState extends State<PrayerPage> {
  late final StorageService _storageService;

  @override
  void initState() {
    super.initState();
    // Retrieve the storage service from the SettingsController
    _storageService = context
        .findAncestorWidgetOfExactType<Pray4MeApp>()!
        .settingsController
        .storageService;
  }

  Future<void> savePrayer() async {
    Prayer prayer = Prayer(
        prayerCode: "TEC_ETH_01",
        prayerTitle: "Innovation in Technology",
        prayerCategory: "Technocratic Ideals",
        prayerSubCategory: "Ethical AI",
        prayerDescription:
            "A prayer for inspiration and breakthroughs in technology.",
        prayerBody:
            "Lord, grant us the wisdom and creativity to innovate and develop technologies that improve lives and advance humanity. May our work in technology be guided by integrity and a desire to serve the greater good.",
        prayerAuthor: "Unknown",
        prayerWordcount: 35,
        prayerFaith: "Non-denominational",
        prayerDateCreated: "2024-06-13",
        prayerResonate: 0,
        prayerAnswered: "No",
        prayerAttachments: [],
        prayerComments: [],
        prayerRead: false);

    // Save the prayer using the appropriate storage service
    await _storageService.saveData('prayer_tec_eth_01', prayer.toMap());
  }

  Future<void> loadPrayer() async {
    // Load the prayer using the appropriate storage service
    Map<String, dynamic> prayerMap =
        await _storageService.loadData('prayer_tec_eth_01');
    Prayer prayer = Prayer.fromMap(prayerMap);
    if (kDebugMode) {
      print('Loaded Prayer: ${prayer.prayerBody}');
    }
  }

  Future<void> deletePrayer() async {
    // Delete the prayer using the appropriate storage service
    await _storageService.deleteData('prayer_tec_eth_01');
    if (kDebugMode) {
      print('Prayer deleted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      restorationId: 'prayers',
      appBar: AppBar(
        title: const Text('Prayer Storage Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            ElevatedButton(
              onPressed: savePrayer,
              child: const Text('Save Prayer'),
            ),
            ElevatedButton(
              onPressed: loadPrayer,
              child: const Text('Load Prayer'),
            ),
            ElevatedButton(
              onPressed: deletePrayer,
              child: const Text('Delete Prayer'),
            ),
          ],
        ),
      ),
    );
  }
}
