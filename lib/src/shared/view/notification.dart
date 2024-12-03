import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_tracker_app/src/shared/view/context_ext.dart';

FlashController<void>? _flashController;

extension NotificationExt on BuildContext {
  Future<void> showErrorNotification({
    required String message,
  }) {
    return _Notificator.of(this).show(message);
  }
}

class _Notificator {
  final BuildContext _context;

  _Notificator.of(BuildContext context) : _context = context;

  Future<void> show(String message) async {
    await _dismissCurrentNotification();
    await _showNotification(message);
  }

  Future<void> _dismissCurrentNotification() async {
    if (_flashController?.controller.isDismissed == false) {
      await _flashController?.dismiss();
    }
  }

  Future<void> _showNotification(String message) async {
    await _context.showFlash<void>(
      duration: const Duration(seconds: 4),
      transitionDuration: const Duration(milliseconds: 200),
      builder: (BuildContext context, FlashController<void> controller) {
        _flashController = controller;
        return FlashBar<void>(
          key: ValueKey(message),
          behavior: FlashBehavior.floating,
          backgroundColor: Colors.transparent,
          controller: controller,
          margin: const EdgeInsets.all(8),
          padding: EdgeInsets.zero,
          content: _NotificationView(message),
        );
      },
    );
  }
}

class _NotificationView extends StatelessWidget {
  final String message;

  const _NotificationView(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.error,
        borderRadius: BorderRadius.circular(2),
      ),
      padding: const EdgeInsets.all(16),
      child: Text(
        message,
        style: context.textTheme.bodyMedium?.copyWith(
          color: context.theme.colorScheme.onError,
        ),
      ),
    );
  }
}
