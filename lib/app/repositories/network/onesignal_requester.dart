import 'package:caronas_usp/app/core/constants.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalRequester {
  static Future<void> subscribe(String email) async {
    OneSignal.shared.setAppId(ONESIGNAL_APP_ID);
    OneSignal.shared.promptUserForPushNotificationPermission();
    OneSignal.shared.setExternalUserId(email);
    // Map<String, dynamic> tags = {
    // };
    // OneSignal.shared.sendTags(tags);
  }

  static Future<void> disablePush(bool disable) async {
    OneSignal.shared.disablePush(disable);
  }
}
