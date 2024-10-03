import 'package:portfolio/src/common/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/entity/redirect_router_entity.dart';

final androidRouterProvider = Provider<GoRouter>(
  name: 'androidRouterProvider',
  (ref) {
    // ref.listen(
    //   googleAccountProvider.select((v) => v.whenData((v) => v != null)),
    //   (p, n) => isAuth.value = n,
    // );
    final router = GoRouter(
      redirectLimit: 1,
      debugLogDiagnostics: true,
      restorationScopeId: Global.appId,
      navigatorKey: Global.navigatorKey,
      // initialLocation: HomePage.route.path,
      refreshListenable: RedirectRouterEntity.notifier,
      routes: [
        // AdaptiveApp.route,
      ],
      redirect: (context, state) async {
        // if (isAuth.value.unwrapPrevious().hasError ||
        //     isAuth.value.isLoading ||
        //     !isAuth.value.hasValue) {
        //   return AuthPage.route.path;
        // }
        // final isInit = await ref.watch(UserDataNotifier.provider.future);
        // if (isInit != null) return HomePage.route.path;
        // if (isInit == null) return InitPage.route.path;
        // final isLoggingIn = state.uri.path == LoginPage.route.path;
        // if (isLoggingIn) return authState ? HomePage.route.path : null;
        // return authState ? null : LoginPage.route.path;
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
