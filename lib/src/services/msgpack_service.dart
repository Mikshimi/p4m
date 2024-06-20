import 'package:flutter/foundation.dart';
import 'package:msgpack_dart/msgpack_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'storage_service.dart';

/*
  The Message Pack Msgpack Storage service is designed with the 
  intention for usage within mobile platforms. 
 */
class MsgpackStorageService implements StorageService {
  @override
  Future<void> saveData(String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    final packed = serialize(value);
    await prefs.setString(key, String.fromCharCodes(packed));
  }

  @override
  Future<dynamic> loadData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final packedString = prefs.getString(key);
    if (packedString == null) return null;
    return deserialize(Uint8List.fromList(packedString.codeUnits));
  }

  @override
  Future<void> deleteData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}
