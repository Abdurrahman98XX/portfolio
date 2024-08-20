import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/common/state_observer.dart';
import 'package:portfolio/src/service/k_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/service/k_device_info.dart';
import 'package:portfolio/src/service/service_locator.dart';
import 'package:portfolio/src/platform/android/android_app.dart';

void main(List<String> args) async {
  return await runWithClient(
    () async {
      await ServiceLocator.setup();
      return runApp(
        ProviderScope(
          overrides: [deviceInfoProvider.overrideWithValue(await KDeviceInfo.instance)],
          observers: [StateObserver()],
          child: const AndroidApp(),
        ),
      );
    },
    KClient.service(),
  );
}
