import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract interface class Const {
  static const isWeb = kIsWeb || kIsWasm;

  static const id = 'com.atumra.portfolio';
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
}
