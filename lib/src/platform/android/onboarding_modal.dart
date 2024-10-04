import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/common/platform.dart';
import 'package:portfolio/src/entity/cache_keys_entity.dart';
import 'package:portfolio/src/service/service_locator.dart';

class OnboardingModal extends ConsumerStatefulWidget {
  const OnboardingModal({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingModalState();
  static Future<T?> showModal<T>(BuildContext context) async {
    final val = await ServiceLocator.cache.provider
        .getBool(CacheKeysEntity().onboardDone.name);
    if (val ?? false) return null;
    return await showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isDismissible: false,
      builder: (context) => OnboardingModal(),
    );
  }
}

final _pages = [
  Center(child: Text('First Page')),
  Center(child: Text('Second Page')),
  Center(child: Text('Third Page')),
];

class _OnboardingModalState extends ConsumerState<OnboardingModal>
    with TickerProviderStateMixin {
  //
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: _pages.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) return;
    _tabController.index = currentPageIndex;
    setState(() => _currentPageIndex = currentPageIndex);
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 400),
    );
  }

  bool get _isOnDesktopAndWeb {
    if (KPlatform.isBrowser) return true;
    if (KPlatform.isDesktop) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView(
          controller: _pageViewController,
          onPageChanged: _handlePageViewChanged,
          children: _pages,
        ),
        PageIndicator(
          tabController: _tabController,
          currentPageIndex: _currentPageIndex,
          onUpdateCurrentPageIndex: _updateCurrentPageIndex,
          isOnDesktopAndWeb: _isOnDesktopAndWeb,
        ),
      ],
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) return const SizedBox.shrink();
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 0) return;
              onUpdateCurrentPageIndex(currentPageIndex - 1);
            },
            icon: const Icon(Icons.arrow_left_rounded, size: 32.0),
          ),
          TabPageSelector(
            controller: tabController,
            color: colorScheme.surface,
            selectedColor: colorScheme.primary,
          ),
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == (tabController.length - 1)) return;
              onUpdateCurrentPageIndex(currentPageIndex + 1);
            },
            icon: const Icon(Icons.arrow_right_rounded, size: 32.0),
          ),
        ],
      ),
    );
  }
}
