import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:portfolio/src/app.dart';
import 'package:portfolio/src/service/http_client_service.dart';
import 'package:portfolio/src/service/service_locator.dart';
import 'package:portfolio/src/common/state_observer.dart';

void main(List<String> args) async {
  await ServiceLocator.setup();
  runWithClient(
    () => runApp(
      const ProviderScope(
        observers: [StateObserver()],
        child: App(),
      ),
    ),
    HttpClient.service(),
  );
}
