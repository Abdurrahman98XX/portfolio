import 'package:go_router/go_router.dart';
import 'package:portfolio/src/common/const.dart';
import 'package:portfolio/src/platform/android/android_routes.dart';
import 'package:portfolio/src/service/service_locator.dart';
import 'package:talker_flutter/talker_flutter.dart';

final globalRouter = GoRouter(
  redirectLimit: 0,
  // debugLogDiagnostics: true,
  restorationScopeId: Const.appId,
  navigatorKey: Const.navigatorKey,
  observers: [TalkerRouteObserver(ServiceLocator.logger)],
  routes: androidRoutes,
);
