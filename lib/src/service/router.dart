part of 'service_locator.dart';

GoRouter get _router {
  return GoRouter(
    redirectLimit: 0,
    restorationScopeId: Const.id,
    navigatorKey: Const.navigatorKey,
    routes: [],
  );
}
