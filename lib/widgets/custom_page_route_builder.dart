import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_money/widgets/custom_platform.dart';

enum RouteTransition {
  defaultAnimation,
  fade,
  fadeThrough,
  fadeScale,
  none,
  slideVertically,
}

class CustomPageRouteBuilder {
  CustomPageRouteBuilder._();

  static Page<T> _route<T>({
    required Widget child,
    bool maintainState = true,
    bool fullscreenDialog = false,
    LocalKey? key,
    String? name,
    Object? arguments,
    String? restorationId,
    Duration? transitionDuration,
    RouteTransition? transitionType,
  }) {
    final tType = transitionType ?? RouteTransition.defaultAnimation;

    if (tType == RouteTransition.defaultAnimation) {
      return MaterialPage<T>(
        key: key,
        name: name,
        child: child,
        maintainState: maintainState,
        fullscreenDialog: fullscreenDialog,
        arguments: arguments,
        restorationId: restorationId,
      );
    }

    return CustomTransitionPage<T>(
      transitionDuration:
          transitionDuration ?? const Duration(milliseconds: 300),
      key: key,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      arguments: arguments,
      restorationId: restorationId,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (tType) {
          case RouteTransition.fade:
            return FadeTransition(opacity: animation, child: child);

          case RouteTransition.fadeThrough:
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          case RouteTransition.fadeScale:
            return FadeScaleTransition(animation: animation, child: child);

          case RouteTransition.slideVertically:
            if (CustomPlatform.isIOS) {
              return CupertinoFullscreenDialogTransition(
                primaryRouteAnimation: animation,
                secondaryRouteAnimation: const AlwaysStoppedAnimation(0),
                linearTransition: false,
                child: child,
              );
            }
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );

          default:
            return child;
        }
      },
    );
  }

  static Page route<T>({
    required Widget child,
    bool maintainState = true,
    bool fullscreenDialog = false,
    LocalKey? key,
    String? name,
    Object? arguments,
    String? restorationId,
    Duration? transitionDuration,
    RouteTransition? transitionType,
  }) {
    return CustomPageRouteBuilder._route<T>(
      name: name,
      key: key,
      child: child,
      arguments: arguments,
      restorationId: restorationId,
      fullscreenDialog: fullscreenDialog,
      maintainState: maintainState,
      transitionDuration: transitionDuration,
      transitionType: transitionType,
    );
  }
}
