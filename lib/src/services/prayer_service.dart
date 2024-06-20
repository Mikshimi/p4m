/*
  In the event that prayers would be server based and not locally
  then part2 would be usefull...
 */
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/prayer.dart';

// class PrayerService {
//   final String apiUrl = 'https://api.p4m.com/prayers';

//   Future<List<Prayer>> fetchPrayers() async {
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       List<dynamic> body = jsonDecode(response.body);
//       return body.map((dynamic item) => Prayer.fromMap(item)).toList();
//     } else {
//       throw Exception('Failed to load prayers');
//     }
//   }
// }
