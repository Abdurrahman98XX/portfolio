import 'package:go_router/go_router.dart';
import 'package:portfolio/src/common/global.dart';
import 'package:portfolio/src/platform/android_routes.dart';

final globalRouter = GoRouter(
  redirectLimit: 0,
  debugLogDiagnostics: true,
  restorationScopeId: Global.appId,
  navigatorKey: Global.navigatorKey,
  routes: androidRoutes,
);
