import 'package:portfolio/src/common/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/entity/redirect_router_entity.dart';
import 'package:portfolio/src/platform/android/home_page.dart';
import 'package:portfolio/src/platform/android/sub_page.dart';

final authController = StateProvider<bool>((ref) => false);

final androidRouterProvider = Provider<GoRouter>(
  name: 'androidRouterProvider',
  (ref) {
    ref.listen(
      authController,
      (previous, next) => RedirectRouterEntity.notifier.value =
          RedirectRouterEntity.notifier.value.copyWith(isInit: next),
    );
    final router = GoRouter(
      redirectLimit: 1,
      debugLogDiagnostics: true,
      restorationScopeId: Global.appId,
      navigatorKey: Global.navigatorKey,
      initialLocation: HomePage.route.path,
      refreshListenable: RedirectRouterEntity.notifier,
      routes: [
        SubPage.route,
        HomePage.route,
      ],
      redirect: (context, state) async {
        final f = RedirectRouterEntity.notifier.value;
        if (!f.isInit) return HomePage.route.path;
        if (f.isInit) return SubPage.route.path;
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
