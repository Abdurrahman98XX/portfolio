import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/module/theme/controller/theme_mode_controller.dart';
import 'package:portfolio/src/service/service_locator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                GoRouter.of(context).go('/settings');
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                final watch = ref.watch(themeModeControllerProvider).themeMode;
                final watchLight = watch == ThemeMode.light || isLight;
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(turns: animation, child: child);
                  },
                  child: IconButton(
                    onPressed: ref.read(themeModeControllerProvider.notifier).toggle,
                    icon: Icon(
                      watchLight ? Icons.mode_night_outlined : Icons.wb_sunny_outlined,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: StreamBuilder(
          stream: ServiceLocator.worker.responseStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text('${snapshot.data}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
