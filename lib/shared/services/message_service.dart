import 'package:flutter/material.dart';
import 'package:vestrollmobile/core/utils/enums/enum_file.dart';
import 'package:vestrollmobile/shared/services/overlay_message.dart';

class MessageService {
  static OverlayEntry? _currentOverlay;

  /// [context] - BuildContext to find the overlay
  /// [title] - Title of the message
  /// [message] - Content of the message
  /// [type] - MessageType.error or MessageType.success
  /// [duration] - How long the message stays visible
  static void showMessage({
    required BuildContext context,
    required String title,
    required String message,
    MessageType type = MessageType.error,
    Duration duration = const Duration(seconds: 3),
  }) {
    // Dismiss any existing overlay first
    _dismissCurrent();

    final overlay = OverlayEntry(
      builder:
          (context) => Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            right: 0,
            child: Material(
              color: Colors.transparent,
              child: OverlayMessage(
                title: title,
                message: message,
                type: type,
                duration: duration,
                onDismiss: () {
                  _dismissCurrent();
                },
              ),
            ),
          ),
    );

    _currentOverlay = overlay;
    Overlay.of(context).insert(overlay);
  }

  /// Shows an error message
  static void showError(BuildContext context, String title, String message) {
    showMessage(
      context: context,
      title: title,
      message: message,
      type: MessageType.error,
    );
  }

  /// Shows a success message
  static void showSuccess(BuildContext context, String title, String message) {
    showMessage(
      context: context,
      title: title,
      message: message,
      type: MessageType.success,
    );
  }

  /// Dismisses the current overlay if it exists
  static void _dismissCurrent() {
    _currentOverlay?.remove();
    _currentOverlay = null;
  }
}
