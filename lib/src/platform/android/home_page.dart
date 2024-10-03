import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/platform/android/android_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static final route = GoRoute(
    path: '/',
    name: 'home',
    builder: (context, state) => HomePage(),
  );
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () => ref.read(authController.notifier).state = true,
          child: Text('data'),
        ),
      ),
    );
  }
}
