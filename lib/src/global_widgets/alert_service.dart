// ignore_for_file: unused_import

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pray_for_me/src/global_widgets/custom_text.dart';

//will be used for certain cases
enum AlertType { success, error, warning }

class AlertService {
  void showAlert({
    required String title,
    required String body,
    required AlertType type,
    
  }) {
      /* Here i would like to just create a slide in rectangular container
        from the bottom right of the screen. similar to receiving a notification
        the text itself would be small but visible, prefably a dark background 
        with light accent text depending on the users active theme choice. 
        Success: when a user completes task without issues 
        Warning: usecase example, when the user tries to upload their
        own background images, if the image file exceeds lets say 20mb, then 
        a warning alert will be displayed warning about.
        Error: when task cannot be completed. 
        it disappears either after an elapsed time of say 5 seconds, 
        user's gesture swipes the notification right/left or clicks/taps the 
        (x) icon located on the far right of the notication title. 
      */

  }

  // ignore: unused_element
  Color _chooseColor(AlertType type) {
    if (type == AlertType.success) {
      return Colors.green;
    } else if (type == AlertType.error) {
      return Colors.red;
    } else {
      return Colors.orange;
    }
  }

  // ignore: unused_element
  String _chooseTitle(String title, AlertType type) {
    if (type == AlertType.success) {
      return "Success!!!";
    } else if (type == AlertType.error) {
      return "Error!!!";
    } else {
      return "Warning!!!";
    }
  }

  // ignore: unused_element
  IconData _chooseIcon(AlertType type) {
    if (type == AlertType.success) {
      return Icons.check_circle_outline;
    } else if (type == AlertType.error) {
      return Icons.error_outline;
    } else {
      return Icons.info_outline;
    }
  }
}
