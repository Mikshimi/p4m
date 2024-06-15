// views/prayers_view.dart
import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../models/prayer.dart';
import '../../services/file_storage_service.dart';
import '../../services/msgpack_service.dart';


class PrayerPage extends StatefulWidget {
  const PrayerPage({super.key});
  static const routeName = '/prayer';

  @override
  // ignore: library_private_types_in_public_api
  _PrayerPageState createState() => _PrayerPageState();
}

class _PrayerPageState extends State<PrayerPage> {
  final MsgpackService _msgpackService = MsgpackService();
  final FileStorageService _fileStorageService = FileStorageService();
  
  Future<void> savePrayer() async {
    Prayer prayer = Prayer(
      prayerCode: "TEC_ETH_01",
      prayerTitle: "Innovation in Technology",
      prayerCategory: "Technocratic Ideals",
      prayerSubCategory: "Ethical AI",
      prayerDescription: "A prayer for inspiration and breakthroughs in technology.",
      prayerBody: "Lord, grant us the wisdom and creativity to innovate and develop technologies that improve lives and advance humanity. May our work in technology be guided by integrity and a desire to serve the greater good.",
      prayerAuthor: "Unknown",
      prayerWordcount: 35,
      prayerFaith: "Non-denominational",
      prayerDateCreated: "2024-06-13",
      prayerResonate: 0,
      prayerAnswered: "No",
      prayerAttachments: [],
      prayerComments: [],
    );

    Uint8List data = _msgpackService.serializePrayer(prayer);
    await _fileStorageService.writeData('prayer_tec_eth_01.msgpack', data);
  }

  Future<void> loadPrayer() async {
    Uint8List data = await _fileStorageService.readData('prayer_tec_eth_01.msgpack');
    Prayer prayer = _msgpackService.deserializePrayer(data);
    print('Loaded Prayer: ${prayer.prayerBody}');
  }

  Future<void> deletePrayer() async {
    await _fileStorageService.deleteData('prayer_tec_eth_01.msgpack');
    print('Prayer deleted');
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