import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// this is a wrapper class for FirebaseCrashlytics.
class Crashlytics {
  Crashlytics._();

  static FirebaseCrashlytics get crashlytics => FirebaseCrashlytics.instance;

  /// Enable or disable the Firebase crash collection
  static Future<void> init() async {
    // Check for debug mode
    if (kDebugMode) {
      // disable / enable the crashlytics in debug mode
      await crashlytics.setCrashlyticsCollectionEnabled(false);
    } else {
      // disable / enable the crashlytics in release mode
      await crashlytics.setCrashlyticsCollectionEnabled(true);
    }
  }

  // To add user IDs to your reports, assign each user with a unique ID.
  static Future<void> setUser(String user) async {
    await crashlytics.setUserIdentifier(user);
  }

  //To add custom Crashlytics log messages to your app, use the log method
  static Future<void> log(String message) async {
    await crashlytics.log(message);
  }

  /// If you would like to record a fatal error, you may pass in a [fatal] argument as [true].
  /// The crash report will appear in your Crashlytics dashboard with the event type Crash,
  /// the event summary stack trace will also be referenced as a Fatal Exception.
  static Future<void> fatalCrash(
      {required dynamic exception,
      required StackTrace stack,
      String? reason}) async {
    // only log when crash collection is enabled
    if (crashlytics.isCrashlyticsCollectionEnabled) {
      await crashlytics.recordError(
        exception,
        stack,
        reason: reason ?? 'Fatal Error',
        fatal: true,
      );
    }
  }

  /// By default non-fatal errors are recorded.
  /// The crash report will appear in your Crashlytics dashboard with the event type Non-fatal,
  ///the event summary stack trace will also be referenced as a Non-fatal Exception
  static Future<void> nonFatalCrash(
      {required dynamic exception,
      required StackTrace stack,
      String? reason}) async {
    // only log when crash collection is enabled
    if (crashlytics.isCrashlyticsCollectionEnabled) {
      await crashlytics.recordError(
        exception,
        stack,
        reason: reason ?? 'Non-Fatal Error',
      );
    }
  }
}
