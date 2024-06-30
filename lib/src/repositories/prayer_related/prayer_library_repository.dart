// import 'dart:io';
// import 'package:flutter/foundation.dart' show kDebugMode;
// import '../../app_config.dart';
// import '../../models/prayer.dart';
// import '../../services/path_provider_service.dart';


// class PrayerLibraryRepository {
//   final PathProviderService pathProviderService;

//   PrayerLibraryRepository(this.pathProviderService);

//   Future<String> _getFilePath(String libraryName) async {
//     final path = await pathProviderService.getLibraryPath();
//     return '$path/$libraryName.${AppConfig.libraryExtension}'.replaceAll('\\', '/');
//   }

//   Future<List<Prayer>> loadPrayers(String libraryName, {String lengthCategory = 'short'}) async {
//     try {
//       final seedFilePath = await _getFilePath(libraryName);
//       final seedFile = File(seedFilePath);

//       if (await seedFile.exists()) {
//         final rawText = await seedFile.readAsString();
//         final segments = rawText.split(RegExp(r'\r?\n(short|medium|long)\r?\n'));
//         final prayers = <Prayer>[];

//         int categoryIndex = ['short', 'medium', 'long'].indexOf(lengthCategory);
//         if (categoryIndex == -1 || categoryIndex >= segments.length) {
//           throw Exception('Invalid prayer length category');
//         }

//         final lines = segments[categoryIndex + 1].split('\n');
//         for (var line in lines) {
//           final parts = line.split('#%*&');
//           if (parts.length >= 8) {
//             final prayerCode = _generatePrayerCode(parts);
//             final prayer = Prayer.fromRawText(line, prayerCode);
//             prayers.add(prayer);
//           }
//         }

//         return prayers;
//       } else {
//         throw Exception('Library seed file not found');
//       }
//     } on Exception catch (e) {
//       if (kDebugMode) {
//         print("Error: $e");
//       }
//       return [];
//     }
//   }

//   String _generatePrayerCode(List<String> parts) {
//     final category = parts[1].substring(0, 3);
//     final subCategory = parts[2].substring(0, 3);
//     final title = parts[0].substring(0, 3);
//     final numericalOrder = parts[2].length; 
//     return '$category$subCategory$title$numericalOrder';
//   }
// }
