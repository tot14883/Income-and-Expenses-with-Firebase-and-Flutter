import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_money/core/get_it/di_instance.dart';
import 'package:smart_money/core/route/route_name.dart';
import 'package:smart_money/features/authentication/pages/loging_screen.dart';
import 'package:smart_money/features/example/bloc/example_bloc.dart';
import 'package:smart_money/features/example/pages/example_screen.dart';
import 'package:smart_money/features/home/pages/home_screen.dart';
import 'package:smart_money/features/income_expenses/bloc/income_expenses_bloc.dart';
import 'package:smart_money/features/income_expenses/model/response/my_account_response.dart';
import 'package:smart_money/features/income_expenses/pages/add_cash_screen.dart';
import 'package:smart_money/features/income_expenses/pages/income_expenses_edit_screen.dart';
import 'package:smart_money/features/income_expenses/pages/income_expenses_screen.dart';
import 'package:smart_money/features/saving/bloc/saving_bloc.dart';
import 'package:smart_money/features/saving/pages/saving_edit_screen.dart';
import 'package:smart_money/features/saving/pages/saving_screen.dart';
import 'package:smart_money/features/summarize/bloc/summary_bloc.dart';
import 'package:smart_money/features/summarize/pages/summary_screen.dart';
import 'package:smart_money/widgets/custom_page_route_builder.dart';
import 'package:smart_money/widgets/no_internet_connection_screen.dart';
import 'package:smart_money/widgets/no_route_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey(debugLabel: 'shell');

RouteObserver get routeObserverProvider => RouteObserver<ModalRoute>();

/// GoRouter provider
@Singleton()
class GoRouterProvider {
  GoRouter get initial {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/$login',
      restorationScopeId: 'route',
      observers: [routeObserverProvider],
      // redirectLimit: 3,
      redirect: (context, state) {
        return null;
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: root,
          pageBuilder: (context, state) => CustomPageRouteBuilder.route(
            transitionType: RouteTransition.fadeThrough,
            key: state.pageKey,
            child: BlocProvider<ExampleBloc>(
              create: (BuildContext context) => getIt<ExampleBloc>(),
              child: const ExampleScreen(),
            ),
          ),
        ),
        GoRoute(
          path: '/$login',
          name: login,
          pageBuilder: (context, state) => CustomPageRouteBuilder.route(
            transitionType: RouteTransition.fadeThrough,
            key: state.pageKey,
            child: LoginScreen(key: state.pageKey),
          ),
        ),
        GoRoute(
          path: '/$home',
          name: home,
          pageBuilder: (context, state) => CustomPageRouteBuilder.route(
            transitionType: RouteTransition.fadeThrough,
            key: state.pageKey,
            child: HomeScreen(key: state.pageKey),
          ),
        ),
        GoRoute(
          path: '/$incomeAndExpenses',
          name: incomeAndExpenses,
          pageBuilder: (context, state) => CustomPageRouteBuilder.route(
            transitionType: RouteTransition.fadeThrough,
            key: state.pageKey,
            child: BlocProvider<IncomeExpensesBloc>(
              create: (BuildContext context) => getIt<IncomeExpensesBloc>(),
              child: IncomeExpensesScreen(key: state.pageKey),
            ),
          ),
        ),
        GoRoute(
          path: '/$noInternet',
          name: noInternet,
          pageBuilder: (context, state) => CustomPageRouteBuilder.route(
            transitionType: RouteTransition.fadeThrough,
            key: state.pageKey,
            child: NoInternetConnectionScreen(key: state.pageKey),
          ),
        ),
        GoRoute(
          path: '/$addCash',
          name: addCash,
          pageBuilder: (context, state) => CustomPageRouteBuilder.route(
            transitionType: RouteTransition.fadeThrough,
            key: state.pageKey,
            child: BlocProvider<IncomeExpensesBloc>(
              create: (BuildContext context) => getIt<IncomeExpensesBloc>(),
              child: AddCashScreen(key: state.pageKey),
            ),
          ),
        ),
        GoRoute(
          path: '/$saving',
          name: saving,
          pageBuilder: (context, state) => CustomPageRouteBuilder.route(
            transitionType: RouteTransition.fadeThrough,
            key: state.pageKey,
            child: BlocProvider<SavingBloc>(
              create: (BuildContext context) => getIt<SavingBloc>(),
              child: SavingScreen(key: state.pageKey),
            ),
          ),
        ),
        GoRoute(
          path: '/$editSaving',
          name: editSaving,
          pageBuilder: (context, state) {
            final _myAccountDetail = state.extra as MyAccountDetailResponse;

            return CustomPageRouteBuilder.route(
              transitionType: RouteTransition.fadeThrough,
              key: state.pageKey,
              child: BlocProvider<SavingBloc>(
                create: (BuildContext context) => getIt<SavingBloc>(),
                child: SavingEditScreen(
                  key: state.pageKey,
                  myAccountDetail: _myAccountDetail,
                ),
              ),
            );
          },
        ),
        GoRoute(
          path: '/$editIncomeExpenses',
          name: editIncomeExpenses,
          pageBuilder: (context, state) {
            final _myAccountDetail = state.extra as MyAccountDetailResponse;

            return CustomPageRouteBuilder.route(
              transitionType: RouteTransition.fadeThrough,
              key: state.pageKey,
              child: BlocProvider<IncomeExpensesBloc>(
                create: (BuildContext context) => getIt<IncomeExpensesBloc>(),
                child: IncomeExpensesEditScreen(
                  key: state.pageKey,
                  myAccountDetail: _myAccountDetail,
                ),
              ),
            );
          },
        ),
        GoRoute(
          path: '/$summary',
          name: summary,
          pageBuilder: (context, state) => CustomPageRouteBuilder.route(
            transitionType: RouteTransition.fadeThrough,
            key: state.pageKey,
            child: BlocProvider<SummaryBloc>(
              create: (BuildContext context) => getIt<SummaryBloc>(),
              child: SummaryScreen(
                key: state.pageKey,
              ),
            ),
          ),
        ),
        // ShellRoute(
        //   navigatorKey: _shellNavigatorKey,
        //   builder: (context, state, child) {
        //     return MainScreen(key: state.pageKey, child: child);
        //   },
        //   routes: <RouteBase>[
        //     /// The first screen to display in the bottom navigation bar.
        //     GoRoute(
        //       path: '/$dashboard',
        //       name: dashboard,
        //       pageBuilder: (context, state) {
        //         return NoTransitionPage<void>(
        //           key: state.pageKey,
        //           child: BlocProvider<ExampleBloc>(
        //             create: (BuildContext context) => getIt<ExampleBloc>(),
        //             child: ExampleScreen(
        //               key: state.pageKey,
        //             ),
        //           ),
        //         );
        //       },
        //     ),
        //   ],
        // ),
      ],
      errorBuilder: (context, state) => NoRouteScreen(
        errorMsg: state.error.toString(),
        key: state.pageKey,
      ),
    );
  }
}
