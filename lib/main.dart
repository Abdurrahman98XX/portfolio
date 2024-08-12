import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:portfolio/src/app.dart';
import 'package:portfolio/src/service/client.dart';
import 'package:portfolio/src/service/service_locator.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger_observer.dart';

void main(List<String> args) async {
  return await runWithClient(
    () async {
      await ServiceLocator.setup();
      return runApp(
        ProviderScope(
          observers: [TalkerRiverpodObserver(talker: ServiceLocator.logger)],
          child: const App(),
        ),
      );
    },
    KClient.service(),
  );
}
