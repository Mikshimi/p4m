import 'dart:typed_data';
import 'package:msgpack_dart/msgpack_dart.dart';

import '../models/prayer.dart';

class MsgpackService {
  Uint8List serializePrayer(Prayer prayer) {
    return serialize(prayer.toMap());
  }

  Prayer deserializePrayer(Uint8List data) {
    Map<String, dynamic> prayerMap = deserialize(data);
    return Prayer.fromMap(prayerMap);
  }
}
