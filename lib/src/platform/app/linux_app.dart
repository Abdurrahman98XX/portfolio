import 'package:flutter/widgets.dart';
import 'package:yaru/yaru.dart';

class LinuxApp extends StatelessWidget {
  const LinuxApp({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) => YaruTheme(child: child);
}
