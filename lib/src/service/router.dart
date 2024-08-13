part of 'service_locator.dart';

final _router = GoRouter(
  redirectLimit: 0,
  debugLogDiagnostics: true,
  restorationScopeId: Const.id,
  navigatorKey: Const.navigatorKey,
  observers: [TalkerRouteObserver(ServiceLocator.logger)],
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('About'),
            ),
          ),
        );
      },
    ),
  ],
);
