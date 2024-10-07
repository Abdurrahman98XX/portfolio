import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/module/router/model/redirect_router_entity.dart';
import 'package:portfolio/src/platform/android/home_page.dart';

final routerProvider = Provider.family<
    GoRouter,
    ({
      List<RouteBase> routes,
      FutureOr<String?> Function(
        BuildContext,
        GoRouterState,
      ) redirect,
    })>(
  name: 'routerProvider',
  (ref, record) {
    final router = GoRouter(
      redirectLimit: 1,
      routes: record.routes,
      redirect: record.redirect,
      debugLogDiagnostics: true,
      restorationScopeId: Global.appId,
      navigatorKey: Global.navigatorKey,
      initialLocation: HomePage.route.path,
      refreshListenable: RedirectRouterEntity.notifier,
    );
    ref.onDispose(() {
      router.dispose();
      RedirectRouterEntity.notifier.dispose();
    });
    return router;
  },
);
