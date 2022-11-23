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

  static Future<void> disablePush() async {
    OneSignal.shared.disablePush(true);
  }

  static Future<void> enablePush() async {
    OneSignal.shared.disablePush(false);
  }
}
