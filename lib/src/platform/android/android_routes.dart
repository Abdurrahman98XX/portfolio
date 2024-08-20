import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRoute, GoRouter;
import 'package:portfolio/src/platform/android/page/home_page.dart';

final List<GoRoute> androidRoutes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
    routes: [
      GoRoute(
        path: 'settings',
        builder: (context, state) => Scaffold(
          body: Center(
            child: IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
      ),
      GoRoute(
        path: 'search',
        builder: (context, state) => Scaffold(
          body: Center(
            child: IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
      ),
    ],
  ),
];
