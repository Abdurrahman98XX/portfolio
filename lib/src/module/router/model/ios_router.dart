import 'package:portfolio/src/common/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/module/router/model/redirect_router_entity.dart';
import 'package:portfolio/src/platform/android/home_page.dart';

final iosRouterProvider = Provider<GoRouter>(
  name: 'iosRouterProvider',
  (ref) {
    // ref.listen(
    //   provider,
    //   (previous, next) => RedirectRouterEntity.notifier.value =
    //       RedirectRouterEntity.notifier.value.copyWith(),
    // );
    final router = GoRouter(
      redirectLimit: 1,
      debugLogDiagnostics: true,
      restorationScopeId: Global.appId,
      navigatorKey: Global.navigatorKey,
      initialLocation: HomePage.route.path,
      refreshListenable: RedirectRouterEntity.notifier,
      routes: [
        HomePage.route,
      ],
      redirect: (context, state) async {
        final f = RedirectRouterEntity.notifier.value;
        if (!f.isInit) return HomePage.route.path;
        return null;
      },
    );
    ref.onDispose(() {
      router.dispose();
      RedirectRouterEntity.notifier.dispose();
    });
    return router;
  },
);
