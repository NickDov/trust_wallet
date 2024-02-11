import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_wallet_desktop/features/auth/presentation/pincode.dart/pincode.dart';
import 'package:trust_wallet_desktop/features/init/presentation/init.dart';

import '../../features/auth/presentation/welcome/welcome.dart';
import '../app_data.dart';

final _routes = RoutesList();

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');

class RoutesList {
  final String init = '/';

  // PincodeScrren
  String get _pincodeScreenName => 'pincodeScreen';
  String get pincodeScreen => '$init$_pincodeScreenName';

  // WelcomeScreens
  String get _welcomeScreenName => 'welcome';
  String get welcomeScreen => '$init$_welcomeScreenName';

  // Create new wallet

  String get _createWalletScreenName => 'createWallet';
  String get createWalletScreenScreen =>
      '$welcomeScreen/$_createWalletScreenName';

  // Home

  String get _homeScreenName => 'homeScreen';
  String get homeScreen => '$init$_homeScreenName';

  // Tx App

  String get _txAppScreenName => 'txAppScreen';
  String get txAppScreen => '$init$_txAppScreenName';
}

class Routes {
  Routes();

  String init = AppData.routes.txAppScreen;

  late final GoRouter routerConfig = GoRouter(
    navigatorKey: rootNavigator,
    initialLocation: init,
    routes: [
      GoRoute(
        path: AppData.routes.init,
        builder: (BuildContext context, GoRouterState state) {
          return const InitPage();
        },
        routes: [
          GoRoute(
            path: AppData.routes._pincodeScreenName,
            builder: (BuildContext context, GoRouterState state) {
              return const PinCodeScreen();
            },
            routes: const [],
          ),
          GoRoute(
            path: AppData.routes._welcomeScreenName,
            builder: (BuildContext context, GoRouterState state) {
              return const WelcomeScreen();
            },
            routes: const [],
          ),
          // GoRoute(
          //   path: AppData.routes._homeScreenName,
          //   builder: (BuildContext context, GoRouterState state) {
          //     return const HomeScreen();
          //   },
          // ),
        ],
      ),
      // GoRoute(
      //   path: AppData.routes.txAppScreen,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const SplashScreen();
      //   },
      // ),
    ],
  );
}
