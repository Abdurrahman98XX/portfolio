import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/platform/android/android_router.dart';

class SubPage extends ConsumerWidget {
  const SubPage({super.key});
  static final route = GoRoute(
    path: '/sub',
    name: 'sub',
    builder: (context, state) => SubPage(),
  );
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text('SUB')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => ref.read(authController.notifier).state = false,
          child: Text('data'),
        ),
      ),
    );
  }
}
