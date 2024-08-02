import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/app.dart';
import 'package:portfolio/src/common/service_locator.dart';

void main(List<String> args) async {
  await ServiceLocator.setup();
  runApp(const ProviderScope(child: App()));
}
