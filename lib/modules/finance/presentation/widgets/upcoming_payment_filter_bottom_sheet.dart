import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/widgets/bottom_sheet.dart';

class UpcomingPaymentFilterBottomSheet extends StatefulWidget {
  final Function(Set<String> types, Set<String> statuses) onShowResults;
  final VoidCallback onClear;
  final Set<String> initialTypes;
  final Set<String> initialStatuses;

  const UpcomingPaymentFilterBottomSheet({
    super.key,
    required this.onClear,
    required this.onShowResults,
    this.initialTypes = const {},
    this.initialStatuses = const {},
  });

  @override
  State<UpcomingPaymentFilterBottomSheet> createState() =>
      _UpcomingPaymentFilterBottomSheetState();
}

class _UpcomingPaymentFilterBottomSheetState
    extends State<UpcomingPaymentFilterBottomSheet> {
  late Set<String> _selectedTypes;
  late Set<String> _selectedStatuses;
  bool _isTypeExpanded = true;
  bool _isStatusExpanded = true;

  @override
  void initState() {
    super.initState();
    _selectedTypes = Set.from(widget.initialTypes);
    _selectedStatuses = Set.from(widget.initialStatuses);
    
    // For visual parity with Screenshot 3 if no initial state
    if (_selectedTypes.isEmpty && _selectedStatuses.isEmpty) {
      _selectedTypes = {'Invoice'};
      _selectedStatuses = {'Overdue'};
    }
  }

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
                        if (item == 'All') {
                          if (_selectedTypes.length == 2) {
                            _selectedTypes.clear();
                          } else {
                            _selectedTypes = {'Contract payment', 'Invoice'};
                          }
                        } else {
                          if (_selectedTypes.contains(item)) {
                            _selectedTypes.remove(item);
                          } else {
                            _selectedTypes.add(item);
                          }
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
                        if (item == 'All') {
                          if (_selectedStatuses.length == 2) {
                            _selectedStatuses.clear();
                          } else {
                            _selectedStatuses = {'Coming', 'Overdue'};
                          }
                        } else {
                          if (_selectedStatuses.contains(item)) {
                            _selectedStatuses.remove(item);
                          } else {
                            _selectedStatuses.add(item);
                          }
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
    // Logic for "All" checkbox visual state
    bool showMinus = false;
    bool allChecked = false;
    
    if (label == 'All') {
      final currentList = isStatus ? _selectedStatuses : _selectedTypes;
      final totalPossible = 2; // Contract payment, Invoice OR Coming, Overdue
      if (currentList.length > 0 && currentList.length < totalPossible) {
        showMinus = true;
      } else if (currentList.length == totalPossible) {
        allChecked = true;
      }
    }

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
                ? _buildCheckboxAll(allChecked, showMinus, colors)
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

  Widget _buildCheckboxAll(bool isSelected, bool isIndeterminate, ColorSystemExtension colors) {
    if (!isSelected && !isIndeterminate) {
        return Container(
          width: 20.w,
          height: 20.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(color: colors.gray200, width: 2),
          ),
        );
    }
    return Container(
      width: 20.w,
      height: 20.h,
      decoration: BoxDecoration(
        color: colors.brandDefault,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Icon(
        isIndeterminate ? Icons.remove : Icons.check,
        size: 14.sp,
        color: colors.constantContrast,
      ),
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
            onTap: () {
                setState(() {
                    _selectedTypes.clear();
                    _selectedStatuses.clear();
                });
                widget.onClear();
            },
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
            onTap: () => widget.onShowResults(_selectedTypes, _selectedStatuses),
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
