import 'dart:developer';

class Log {
  static bool isDevMode = true;
  static print(String msg, [String title]) {
    if (!isDevMode) return;
    if (title != null) {
      log('-------------------------------------------------------');
      log(title);
      log('-------------------------------------------------------');
    }
    log(msg);
    log('-------------------------------------------------------');
  }
}
