import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/common/state_observer.dart';
import 'package:portfolio/src/platform/app_adaptive.dart';
import 'package:portfolio/src/service/client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(List<String> args) async {
  return await runWithClient(
    () => runApp(
      ProviderScope(observers: [StateObserver()], child: const AdaptiveApp()),
    ),
    KClient.service(),
  );
}
