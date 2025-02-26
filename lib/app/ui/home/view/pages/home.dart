import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/theme/app_icons_icons.dart';
import '../../../configs/view/pages/configs.dart';
import '../../../vpn/view/pages/vpn.dart';
import '../providers/bottom_nav_index_provider.dart';
import '../widgets/lazy_indexed_stack.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);
    return Scaffold(
      body: LazyIndexedStack(
        index: currentIndex,
        children: const [VpnPage(), ConfigsPage()],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        padding: const EdgeInsets.all(0),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(AppIcons.home),
              activeIcon: Icon(AppIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(AppIcons.globe),
              activeIcon: Icon(AppIcons.globe),
              label: 'All Configs',
            ),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) => ref.read(bottomNavIndexProvider.notifier).update(
                (state) => index,
              ),
        ),
      ),
    );
  }
}
