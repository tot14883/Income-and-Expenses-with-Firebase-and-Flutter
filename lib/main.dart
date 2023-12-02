import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:smart_money/core/firebase/analytics/analytics.dart';
import 'package:smart_money/core/firebase/crashlytics/crashlytics.dart';
import 'package:smart_money/core/firebase/error_listener.dart';
import 'package:smart_money/core/firebase/record_flutter_error.dart';
import 'package:smart_money/core/get_it/configure_dependencies.dart';
import 'package:smart_money/core/get_it/di_instance.dart';
import 'package:smart_money/core/internet/internet_connection_observer.dart';
import 'package:smart_money/core/logging/logging.dart';
import 'package:smart_money/core/route/go_router_provider.dart';
import 'package:smart_money/core/route/route_name.dart';
import 'package:smart_money/firebase_options.dart';
import 'package:smart_money/widgets/base_state.dart';
import 'package:smart_money/widgets/restart_widget.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp],
      );

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // Firebase analytics log app is opened
      await Analytics.logAppOpen();
      // Firebase analytics set session time out to 5 min
      await Analytics.setSessionTimeOutDuration(duration: 5);

      // Initialize firebase crashlytics
      await Crashlytics.init();

      // Record flutter error
      await recordFlutterError();

      // Listen error outside of flutter framework
      await errorListener();

      await SetupLogger.init();

      await MyApp.initialize();

      runApp(
        const RestartWidget(
          child: RootRestorationScope(
            restorationId: 'root',
            child: MyApp(),
          ),
        ),
      );
    },
    (error, stack) => Crashlytics.fatalCrash(
      exception: error,
      stack: stack,
    ),
  );
}

class MyApp extends StatefulWidget {
  static final _logger = Logger('App');

  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();

  static Future<void> initialize() async {
    try {
      _logger.info('initialize');

      await getIt.reset();
      _logger.info('configureDependencies');

      await configureDependencies();

      _logger.info('allReady');
      await getIt.allReady(timeout: const Duration(seconds: 5));
      _logger.info('allReady done');
    } catch (e) {
      _logger.info(e);
    }
    return;
  }
}

class _MyAppState extends BaseState<MyApp> {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey();
  late Stream<bool> connectionStream;

  @override
  void initState() {
    super.initState();
    _networkConnectionListener();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = getIt<GoRouterProvider>().initial;
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          restorationScopeId: "main",
          routerConfig: router,
          scaffoldMessengerKey: scaffoldMessengerKey,
          title: 'Smart Money',
          themeMode: ThemeMode.light,
          theme: ThemeData(
            brightness: Brightness.light,
            useMaterial3: true,
          ),
          builder: (context, child) {
            return SizedBox(
              child: child,
            );
          },
        );
      },
    );
  }

  // Is internet connected
  void _isNetworkConnected() async {
    final isConnected =
        await getIt<InternetConnectionObserver>().isNetConnected();

    if (!isConnected) {
      if (!mounted) return;
      context.push('/$noInternet');
    }
  }

  // Listen network connection state change
  void _networkConnectionListener() {
    connectionStream = getIt<InternetConnectionObserver>().hasConnection.stream;
    connectionStream.listen((isConnected) {
      if (!isConnected) {
        _showNoNetworkSnackBar();
        context.push('/$noInternet');
      }
    });
  }

  // Show snackbar
  void _showNoNetworkSnackBar() {
    if (!mounted) return;
    scaffoldMessengerKey.currentState?.clearSnackBars();
    scaffoldMessengerKey.currentState?.showSnackBar(
      const SnackBar(
        content: Text(
          'No internet connection',
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 5),
      ),
    );
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.resumed:
        _isNetworkConnected();
        break;
      default:
    }
  }
}
