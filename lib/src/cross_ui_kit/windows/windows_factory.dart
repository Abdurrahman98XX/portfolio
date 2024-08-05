class WindowsUiKit implements CrossUiKit {
  const WindowsUiKit();
  @override
  CrossButton button() => const WindowsButton();
  @override
  CrossApp app() => const WindowsApp();
  @override
  CrossScaffold scaffold() => const WindowsScaffold();
}
