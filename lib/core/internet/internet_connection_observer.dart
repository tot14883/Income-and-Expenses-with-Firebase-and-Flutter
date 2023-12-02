import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@Singleton()
class InternetConnectionObserver {
  final InternetConnectionChecker _internetConnectionChecker;
  final Connectivity _connectivity;
  StreamController<bool> hasConnection = StreamController<bool>.broadcast();

  InternetConnectionObserver(
    this._internetConnectionChecker,
    this._connectivity,
  ) {
    _init();
  }

  // Start listening to network state change
  void _init() async {
    _connectivity.onConnectivityChanged.listen((event) async {
      if (event == ConnectivityResult.wifi ||
          event == ConnectivityResult.mobile) {
        final isDeviceConnected =
            await _internetConnectionChecker.hasConnection;
        hasConnection.sink.add(isDeviceConnected);
      } else {
        final isDeviceConnected =
            await _internetConnectionChecker.hasConnection;
        hasConnection.sink.add(isDeviceConnected);
      }
    });
  }

  // Get the current state of network
  Future<bool> isNetConnected() async {
    final isDeviceConnected = await _internetConnectionChecker.hasConnection;
    return isDeviceConnected;
  }
}
