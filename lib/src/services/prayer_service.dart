// services/prayer_service.dart
/*
 */
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/prayer.dart';

// class PrayerService {
//   final String apiUrl = 'https://api.example.com/prayers';

//   Future<List<Prayer>> fetchPrayers() async {
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       List<dynamic> body = jsonDecode(response.body);
//       return body.map((dynamic item) => Prayer.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load prayers');
//     }
//   }
// }
