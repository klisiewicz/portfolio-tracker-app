import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio_tracker_app/src/holdings/provider/holdings_provider.dart';
import 'package:portfolio_tracker_app/src/shared/view/context_ext.dart';
import 'package:portfolio_tracker_app/src/shared/view/hooks.dart';

class HoldingsSearchAppBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const HoldingsSearchAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useDebouncedTextController(
      debounce: const Duration(milliseconds: 500),
      onChanged: (userId) => _updateUserId(userId, ref),
    );
    final asyncHolding = ref.watch(holdingsProvider);
    final appBarBottom = PreferredSize(
      preferredSize: const Size.fromHeight(4),
      child: SizedBox(
        height: 4,
        child: asyncHolding.maybeWhen(
          loading: () => const LinearProgressIndicator(),
          orElse: () => null,
        ),
      ),
    );
    return AppBarWithSearchSwitch(
      customTextEditingController: controller,
      appBarBuilder: (context) {
        return AppBar(
          title: Text(context.text.holdingsPageTitle),
          actions: const [
            AppBarSearchButton(
              searchActiveButtonColor: Colors.transparent,
            ),
          ],
          bottom: appBarBottom,
        );
      },
      fieldHintText: context.text.holdingsUserSearchHint,
      onSubmitted: (userId) => _updateUserId(userId, ref),
      bottom: appBarBottom,
    );
  }

  void _updateUserId(String userId, WidgetRef ref) {
    if (userId.isNotEmpty) {
      ref.read(userIdProvider.notifier).state = userId.trim();
      ref.read(assetTypeFilterProvider.notifier).state = null;
    }
  }
}
