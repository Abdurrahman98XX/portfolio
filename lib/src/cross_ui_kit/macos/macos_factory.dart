class MacosUi implements CrossUiKit {
  const MacosUi();
  @override
  CrossButton button() => const MacosButton();
  @override
  CrossApp app() => const MacosApp();
  @override
  CrossScaffold scaffold() => const MacosScaffold();
}
