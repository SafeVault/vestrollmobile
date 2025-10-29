import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';

class SearchableBottomSheet<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final String Function(T) getItemLabel;
  final String? Function(T)? getItemLeading;
  final void Function(T) onItemSelected;
  final bool Function(T, String)? customFilter;

  const SearchableBottomSheet({
    super.key,
    required this.title,
    required this.items,
    required this.getItemLabel,
    required this.onItemSelected,
    this.getItemLeading,
    this.customFilter,
  });

  @override
  State<SearchableBottomSheet<T>> createState() =>
      _SearchableBottomSheetState<T>();
}

class _SearchableBottomSheetState<T> extends State<SearchableBottomSheet<T>> {
  final TextEditingController _searchController = TextEditingController();
  List<T> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = widget.items;
      } else {
        if (widget.customFilter != null) {
          filteredItems =
              widget.items
                  .where((item) => widget.customFilter!(item, query))
                  .toList();
        } else {
          filteredItems =
              widget.items
                  .where(
                    (item) => widget
                        .getItemLabel(item)
                        .toLowerCase()
                        .contains(query.toLowerCase()),
                  )
                  .toList();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(24),
        ),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: fonts.heading3Bold.copyWith(
                fontSize: 18.sp,
                color: colors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _searchController,
              onChanged: _filterItems,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: colors.textSecondary,
                  fontSize: 18.sp,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: colors.textSecondary,
                  size: 20,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: colors.gray200),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: colors.gray200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: colors.brandDefault,
                    width: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  final leading = widget.getItemLeading?.call(item);

                  return InkWell(
                    onTap: () => widget.onItemSelected(item),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        children: [
                          if (leading != null) ...[
                            Text(leading, style: const TextStyle(fontSize: 24)),
                            const SizedBox(width: 12),
                          ],
                          Expanded(
                            child: Text(
                              widget.getItemLabel(item),
                              style: fonts.bodyMedium.copyWith(
                                color: colors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Helper function to show the searchable bottom sheet
Future<T?> showSearchableBottomSheet<T>({
  required BuildContext context,
  required String title,
  required List<T> items,
  required String Function(T) getItemLabel,
  String? Function(T)? getItemLeading,
  bool Function(T, String)? customFilter,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder:
        (context) => Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 16,
          ),
          child: SearchableBottomSheet<T>(
            title: title,
            items: items,
            getItemLabel: getItemLabel,
            getItemLeading: getItemLeading,
            customFilter: customFilter,
            onItemSelected: (item) {
              Navigator.pop(context, item);
            },
          ),
        ),
  );
}
