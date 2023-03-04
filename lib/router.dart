import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:wayo/screens/onboarding.dart';
import 'package:wayo/screens/storeinfo.dart';
import 'package:wayo/screens/settings.dart';

import 'screens/discover.dart';
import 'screens/home.dart';
import 'screens/landing_screen.dart';
import 'screens/mall_info.dart';
import 'screens/mall_map.dart';
import 'screens/menu.dart';
import 'screens/notifications.dart';
import 'screens/physical_map.dart';
import 'screens/savedplaces.dart';
import 'screens/search.dart';
import 'screens/splash.dart';
import 'widgets/custom_bottomnav.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'Splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'Onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/landing',
      name: 'Landing',
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(
      path: '/',
      name: 'Home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'notifications',
          name: 'Notifications',
          builder: (context, state) => const NotificationsScreen(),
        ),
        GoRoute(
          path: 'physical_map',
          name: 'PhysicalMap',
          builder: (context, state) => const PhysicalMapScreen(),
        ),
        GoRoute(
          path: 'search',
          name: 'Search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: 'discover',
          name: 'Discover',
          builder: (context, state) => const DiscoverScreen(),
        ),
        GoRoute(
          path: 'saved',
          name: 'Saved',
          builder: (context, state) => const SavedPlacesScreen(),
        ),
        GoRoute(
          path: 'menu',
          name: 'Menu',
          builder: (context, state) => const MenuScreen(),
        ),
        GoRoute(
          path: 'mall/:mallId',
          name: 'MallInfo',
          builder: (context, state) {
            final mallId = state.params['mallId'] as String;
            return MallInfoScreen(mallId: mallId);
          },
        ),
        GoRoute(
          path: 'store/:storeId',
          name: 'StoreInfo',
          builder: (context, state) {
            final storeId = state.params['storeId'] as String;
            return StoreInfoScreen(storeId: storeId);
          },
        ),
        GoRoute(
          path: 'map/:modelUrl',
          name: 'MallMap',
          builder: (context, state) {
            final modelUrl = state.params['modelUrl'] as String;
            return MallMapScreen(modelUrl: modelUrl);
          },
        ),
        GoRoute(
          path: 'settings',
          name: 'Settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
  navigatorBuilder: (context, state, child) {
    final isSplash = state.location == '/splash';

    final rootLocations = ['/', '/search', '/discover', '/saved', '/menu'];

    final isRoot = rootLocations.contains(state.location);

    return Navigator(
      onPopPage: (route, result) {
        return route.didPop(result);
      },
      pages: [
        if (isSplash)
          MaterialPage(child: Scaffold(body: child))
        else if (isRoot)
          MaterialPage(
            child: Scaffold(
              body: KeyboardDismisser(child: child),
              bottomNavigationBar: const CustomBottomNav(),
            ),
          )
        else
          MaterialPage(child: Scaffold(body: KeyboardDismisser(child: child)))
      ],
    );
  },
  debugLogDiagnostics: true,
);
