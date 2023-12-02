import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_money/core/get_it/di_instance.dart';
import 'package:smart_money/core/internet/internet_connection_observer.dart';
import 'package:smart_money/widgets/base_state.dart';

class NoInternetConnectionScreen extends StatefulWidget {
  const NoInternetConnectionScreen({Key? key}) : super(key: key);

  @override
  _NoInternetConnectionScreenState createState() =>
      _NoInternetConnectionScreenState();
}

class _NoInternetConnectionScreenState
    extends BaseState<NoInternetConnectionScreen> {
  late Stream<bool> connectionStream;

  @override
  void initState() {
    super.initState();
    networkConnectionListener();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No internet connection.'),
            OutlinedButton.icon(
              onPressed: () {
                isNetworkConnected();
              },
              icon: const Icon(Icons.restore),
              label: const Text('Try Again'),
            )
          ],
        ),
      ),
    );
  }

  void isNetworkConnected() async {
    final isConnected =
        await getIt<InternetConnectionObserver>().isNetConnected();

    if (isConnected) {
      if (!mounted) return;
      context.pop();
    }
  }

  void networkConnectionListener() {
    connectionStream = getIt<InternetConnectionObserver>().hasConnection.stream;
    connectionStream.listen((isConnected) {
      debugPrint(isConnected.toString());
      if (isConnected) {
        if (!mounted) return;
        context.pop();
      }
    });
  }
}
