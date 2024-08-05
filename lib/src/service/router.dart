part of 'service_locator.dart';

GoRouter get _router {
  return GoRouter(
    redirectLimit: 0,
    restorationScopeId: ServiceLocator.id,
    navigatorKey: ServiceLocator.navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return Radio.adaptive;
        },
      ),
      GoRoute(
        path: '/macos',
        builder: (context, state) {
          return MacosApp.router();
        },
      ),
    ],
  );
}
