import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/theme/app_icons_icons.dart';
import '../../../../shared/utils/utils.dart';
import '../../../vpn/view/providers/v2ray_provider.dart';

class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v2ray = ref.watch(v2rayProvider);
    return Center(
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height / 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text('About ${AppUtils.appLabel}'),
                actions: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(AppIcons.cancel),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(AppIcons.user),
                      ),
                      title: const Text('Developer'),
                      subtitle: const Text('HAM'),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(AppIcons.handshake),
                      ),
                      title: const Text(AppUtils.appLabel),
                      subtitle: const Text('Version 2.0'),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(AppIcons.bitcoin),
                      ),
                      title: const Text(AppUtils.appLabel),
                      subtitle: const Text(
                          'This is a free version for personal use.'),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(AppIcons.network),
                      ),
                      title: const Text('V2Ray Core'),
                      subtitle: FutureBuilder(
                        future: v2ray.getCoreVersion(),
                        builder: (context, snapshot) =>
                            Text(snapshot.data ?? 'Loading...'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
