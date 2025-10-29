import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

/// A reusable selection dialog for simple lists
class SelectionDialog<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final String Function(T) getItemLabel;
  final void Function(T) onItemSelected;

  const SelectionDialog({
    super.key,
    required this.title,
    required this.items,
    required this.getItemLabel,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: fonts.heading3Bold.copyWith(
                fontSize: 18.sp,
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            ...items.map(
              (item) => InkWell(
                onTap: () => onItemSelected(item),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    getItemLabel(item),
                    style: fonts.bodyMedium.copyWith(color: colors.textPrimary),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Helper function to show the selection dialog
Future<T?> showSelectionDialog<T>({
  required BuildContext context,
  required String title,
  required List<T> items,
  required String Function(T) getItemLabel,
}) {
  return showDialog<T>(
    context: context,
    builder:
        (context) => SelectionDialog<T>(
          title: title,
          items: items,
          getItemLabel: getItemLabel,
          onItemSelected: (item) {
            Navigator.pop(context, item);
          },
        ),
  );
}
