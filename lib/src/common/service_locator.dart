import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract interface class ServiceLocator {
  static final router = GoRouter(routes: []);
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
}
