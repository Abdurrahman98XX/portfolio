import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/localization/localization.dart';
import 'package:portfolio/src/platform/android/onboarding_modal.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  static final route = GoRoute(
    path: '/',
    name: 'home',
    builder: (context, state) => const HomePage(),
  );
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OnboardingModal.showModal(context);
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.welcome)),
      body: const Center(
        child: ElevatedButton(
          onPressed: null,
          child: Text('data'),
        ),
      ),
    );
  }
}
