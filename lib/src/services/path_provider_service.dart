import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PathProviderService {
  Future<String> getLibraryPath() async {
    if (kIsWeb) {
      // Web-specific path
      return '/web/';
    } else if (Platform.isAndroid || Platform.isIOS) {
      final directory = await getApplicationDocumentsDirectory();
      return directory.path;
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      final directory = await getApplicationSupportDirectory();
      return directory.path;
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
