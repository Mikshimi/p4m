import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

//Will be used for uploading user files to the app (final stages yes).
class PathProviderService {
  Future<String> getLibraryPath() async {
    String path;
    if (kIsWeb) {
      // Web-specific path, using local storage or another mechanism
      path = '/web/'; //this kIsWeb is tricky, since web emulator is in use.
    } else if (Platform.isAndroid || Platform.isIOS) {
      final directory = await getApplicationDocumentsDirectory();
      path = directory.path;
    } else if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      final directory = await getApplicationSupportDirectory();
      path = directory.path;
    } else {
      throw UnsupportedError('Unsupported platform');
    }
    return path.replaceAll('\\', '/'); // Ensure all separators are '/'
  }
}
