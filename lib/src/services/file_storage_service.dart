// import 'dart:io';
// import 'dart:typed_data';
// import 'package:path_provider/path_provider.dart';

// class FileStorageService {
//   Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();
//     return directory.path;
//   }

//   Future<File> _localFile(String fileName) async {
//     final path = await _localPath;
//     return File('$path/$fileName');
//   }

//   Future<File> writeData(String fileName, Uint8List data) async {
//     final file = await _localFile(fileName);
//     return file.writeAsBytes(data);
//   }

//   Future<Uint8List> readData(String fileName) async {
//     try {
//       final file = await _localFile(fileName);
//       return await file.readAsBytes();
//     } catch (e) {
//       throw Exception("Error reading file: $e");
//     }
//   }

//   Future<void> deleteData(String fileName) async {
//     final file = await _localFile(fileName);
//     await file.delete();
//   }
// }
