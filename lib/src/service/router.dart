import 'package:go_router/go_router.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:portfolio/src/platform/android/android_routes.dart';
import 'package:portfolio/src/service/service_locator.dart';
import 'package:talker_flutter/talker_flutter.dart';

final globalRouter = GoRouter(
  redirectLimit: 0,
  // debugLogDiagnostics: true,
  restorationScopeId: Global.appId,
  navigatorKey: Global.navigatorKey,
  observers: [TalkerRouteObserver(ServiceLocator.logger)],
  routes: androidRoutes,
);
