part of 'service_locator.dart';

GoRouter get _router {
  return GoRouter(
    redirectLimit: 0,
    restorationScopeId: ServiceLocator.id,
    // navigatorKey: ServiceLocator.navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Scaffold(
          body: Consumer(
            builder: (context, ref, child) {
              final data = ref.watch(isoProvider);
              var info = data.value ?? 0;
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator.adaptive(),
                    Text(
                      '$info',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      )
    ],
  );
}
