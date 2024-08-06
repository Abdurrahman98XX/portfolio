import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:portfolio/src/app.dart';
import 'package:portfolio/src/service/http_client.dart' as http_client;
import 'package:portfolio/src/service/service_locator.dart';
import 'package:portfolio/src/common/state_observer.dart';

void main(List<String> args) async {
  return await runWithClient(
    () async {
      await ServiceLocator.setup();
      return runApp(
        const ProviderScope(
          observers: [StateObserver()],
          child: App(),
        ),
      );
    },
    http_client.service(),
  );
}
