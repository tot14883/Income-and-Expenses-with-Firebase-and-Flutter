import 'package:flutter/material.dart';

class NoRouteScreen extends StatelessWidget {
  final String errorMsg;
  const NoRouteScreen({required this.errorMsg, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Route Error')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(errorMsg)],
        ),
      ),
    );
  }
}
