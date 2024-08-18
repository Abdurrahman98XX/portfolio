import 'package:go_router/go_router.dart' show GoRoute;
import 'package:portfolio/src/platform/android/page/home_page.dart';

final List<GoRoute> androidRoutes = [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
  )
];
