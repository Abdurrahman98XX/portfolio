import 'package:flutter/widgets.dart';
import 'package:portfolio/src/platform/app_adaptive.dart';
import 'package:yaru/yaru.dart';

class LinuxApp extends AppInterface {
  LinuxApp({super.key, this.child, required super.ref});
  final Widget? child;
  @override
  Widget build(BuildContext context) => YaruTheme(child: child);
}
