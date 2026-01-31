import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/widgets/bottom_sheet.dart';

class UpcomingPaymentFilterBottomSheet extends StatefulWidget {
  final VoidCallback onClear;
  final VoidCallback onShowResults;

  const UpcomingPaymentFilterBottomSheet({
    super.key,
    required this.onClear,
    required this.onShowResults,
  });

  @override
  State<UpcomingPaymentFilterBottomSheet> createState() =>
      _UpcomingPaymentFilterBottomSheetState();
}

class _UpcomingPaymentFilterBottomSheetState
    extends State<UpcomingPaymentFilterBottomSheet> {
  bool _isTypeExpanded = true;
  bool _isStatusExpanded = true;

  // For demonstration/UI purpose as per Figma
  final Set<String> _selectedTypes = {'All', 'Invoice'};
  final Set<String> _selectedStatuses = {'All', 'Overdue'};

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return VestrollBottomSheet(
      title: 'Filter by',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildExpandableSection(
                    title: 'Transaction type',
                    isExpanded: _isTypeExpanded,
                    onToggle:
                        () =>
                            setState(() => _isTypeExpanded = !_isTypeExpanded),
                    items: ['All', 'Contract payment', 'Invoice'],
                    selectedItems: _selectedTypes,
                    onItemToggle: (item) {
                      setState(() {
                        if (_selectedTypes.contains(item)) {
                          _selectedTypes.remove(item);
                        } else {
                          _selectedTypes.add(item);
                        }
                      });
                    },
                    colors: colors,
                    fonts: fonts,
                  ),
                  const Divider(height: 1),
                  _buildExpandableSection(
                    title: 'Status',
                    isExpanded: _isStatusExpanded,
                    onToggle:
                        () => setState(
                          () => _isStatusExpanded = !_isStatusExpanded,
                        ),
                    items: ['All', 'Coming', 'Overdue'],
                    selectedItems: _selectedStatuses,
                    onItemToggle: (item) {
                      setState(() {
                        if (_selectedStatuses.contains(item)) {
                          _selectedStatuses.remove(item);
                        } else {
                          _selectedStatuses.add(item);
                        }
                      });
                    },
                    isStatus: true,
                    colors: colors,
                    fonts: fonts,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),
          _buildActionButtons(colors, fonts),
        ],
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onToggle,
    required List<String> items,
    required Set<String> selectedItems,
    required Function(String) onItemToggle,
    bool isStatus = false,
    required ColorSystemExtension colors,
    required AppFontThemeExtension fonts,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            title,
            style: fonts.textMdBold.copyWith(
              color: colors.textPrimary,
              fontSize: 16.sp,
            ),
          ),
          trailing: Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            color: colors.textPrimary,
          ),
          onTap: onToggle,
        ),
        if (isExpanded)
          ...items.map(
            (item) => _buildFilterItem(
              label: item,
              isSelected: selectedItems.contains(item),
              onTap: () => onItemToggle(item),
              isStatus: isStatus,
              colors: colors,
              fonts: fonts,
            ),
          ),
      ],
    );
  }

  Widget _buildFilterItem({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    bool isStatus = false,
    required ColorSystemExtension colors,
    required AppFontThemeExtension fonts,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            if (isStatus)
              _buildStatusChip(label, colors, fonts)
            else
              Text(
                label,
                style: fonts.textMdRegular.copyWith(
                  color: colors.textPrimary,
                  fontSize: 15.sp,
                ),
              ),
            const Spacer(),
            label == 'All'
                ? _buildCheckboxAll(colors)
                : _buildCheckbox(isSelected, colors),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(
    String label,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    if (label == 'All') {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: colors.blue50,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: colors.blue100),
        ),
        child: Text(
          'All',
          style: fonts.textXsMedium.copyWith(color: colors.blue600),
        ),
      );
    }
    if (label == 'Coming') {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: colors.blue50,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: colors.blue100),
        ),
        child: Text(
          'Coming',
          style: fonts.textXsMedium.copyWith(color: colors.blue600),
        ),
      );
    }
    if (label == 'Overdue') {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: colors.orange50,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: colors.orange100),
        ),
        child: Text(
          'Overdue',
          style: fonts.textXsMedium.copyWith(color: colors.orange600),
        ),
      );
    }
    return Text(label);
  }

  Widget _buildCheckbox(bool isSelected, ColorSystemExtension colors) {
    // Simplified logic to match Figma: 'All' uses a minus icon if partially selected, but here we just follow the UI.
    // In Figma, 'All' has a purple square with a minus sign.
    // 'Invoice' and 'Overdue' have a purple square with a check sign.

    return Container(
      width: 20.w,
      height: 20.h,
      decoration: BoxDecoration(
        color: isSelected ? colors.brandDefault : Colors.transparent,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: isSelected ? colors.brandDefault : colors.gray200,
          width: 2,
        ),
      ),
      child:
          isSelected
              ? Icon(Icons.check, size: 14.sp, color: colors.constantContrast)
              : null,
    );
  }

  // To match Figma exactly for "All" (it has a minus icon)
  Widget _buildCheckboxAll(ColorSystemExtension colors) {
    return Container(
      width: 20.w,
      height: 20.h,
      decoration: BoxDecoration(
        color: colors.brandDefault,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Icon(Icons.remove, size: 14.sp, color: colors.constantContrast),
    );
  }

  Widget _buildActionButtons(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: widget.onClear,
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: colors.gray100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  'Clear all',
                  style: fonts.textMdBold.copyWith(
                    color: colors.textPrimary,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: GestureDetector(
            onTap: widget.onShowResults,
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: colors.brandDefault,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  'Show results',
                  style: fonts.textMdBold.copyWith(
                    color: colors.constantContrast,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
