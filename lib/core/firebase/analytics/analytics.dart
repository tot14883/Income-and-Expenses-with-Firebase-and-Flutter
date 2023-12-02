import 'package:firebase_analytics/firebase_analytics.dart';

/// This is a wrapper class for FirebaseAnalytics
class Analytics {
  Analytics._();

  static FirebaseAnalytics get firebaseAnalytics => FirebaseAnalytics.instance;

  // Set [userId]
  static Future<void> setUserId({required String userId}) async {
    await firebaseAnalytics.setUserId(id: userId);
  }

  // Set user properties. Up to 25 user property names are supported
  static Future<void> setUserProperties(
      {required String name, required String value}) async {
    await firebaseAnalytics.setUserProperty(name: name, value: value);
  }

  // Log a custom event
  static Future<void> logEvent(
      {required String name, Map<String, Object>? param}) async {
    await firebaseAnalytics.logEvent(
      name: name,
      parameters: param,
    );
  }

  // Logs that the application has been opened.
  static Future<void> logAppOpen() async {
    await firebaseAnalytics.logAppOpen();
  }

  // Screen tracking
  static Future<void> logCurrentScreen({required String screenName}) async {
    await firebaseAnalytics.setCurrentScreen(screenName: screenName);
  }

  // Set the duration of inactivity that terminates the current session.
  // Please note that this API is android only.
  static Future<void> setSessionTimeOutDuration({required int duration}) async {
    await firebaseAnalytics
        .setSessionTimeoutDuration(Duration(minutes: duration));
  }

  // To clear all data associated with the current session
  static Future<void> resetAnalyticDate() async {
    await firebaseAnalytics.resetAnalyticsData();
  }

  ///When a user is presented with a list of results, log a view_item_list event including an items array parameter containing the displayed products.
  static Future<void> logItemListView(
      {required String id,
      required String listName,
      required List<AnalyticsEventItem> items}) async {
    await firebaseAnalytics.logViewItemList(
      itemListId: id,
      itemListName: listName,
      items: items,
    );
  }

  ///Once a user selects a particular product from the list, log a select_item event with the chosen product in an items array parameter.
  static Future<void> logItemSelected(
      {required String id,
      required String listName,
      required List<AnalyticsEventItem> items}) async {
    await firebaseAnalytics.logSelectItem(
      itemListId: id,
      itemListName: listName,
      items: items,
    );
  }

  static Future<void> logItemView(
      {required String currency,
      required double value,
      required List<AnalyticsEventItem> items}) async {
    await firebaseAnalytics.logViewItem(
      currency: currency,
      value: value,
      items: items,
    );
  }
}
