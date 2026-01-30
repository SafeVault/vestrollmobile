import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/finance/domain/transaction_model.dart';
import 'package:vestrollmobile/shared/widgets/bottom_sheet.dart';

enum TransactionFilterStatus { all, successful, processing, failed }

enum DateFilterType { last7Days, last14Days, last30Days, custom }

class TransactionFilters {
  final Set<TransactionType> transactionTypes;
  final Set<TransactionFilterStatus> statuses;
  final DateFilterType? dateFilterType;
  final DateTimeRange? customDateRange;

  TransactionFilters({
    Set<TransactionType>? transactionTypes,
    Set<TransactionFilterStatus>? statuses,
    this.dateFilterType,
    this.customDateRange,
  }) : transactionTypes = transactionTypes ?? {TransactionType.all},
       statuses = statuses ?? {TransactionFilterStatus.all};

  DateTimeRange? get dateRange {
    final now = DateTime.now();
    switch (dateFilterType) {
      case DateFilterType.last7Days:
        return DateTimeRange(
          start: now.subtract(const Duration(days: 7)),
          end: now,
        );
      case DateFilterType.last14Days:
        return DateTimeRange(
          start: now.subtract(const Duration(days: 14)),
          end: now,
        );
      case DateFilterType.last30Days:
        return DateTimeRange(
          start: now.subtract(const Duration(days: 30)),
          end: now,
        );
      case DateFilterType.custom:
        return customDateRange;
      case null:
        return null;
    }
  }

  bool get hasActiveFilters {
    return !transactionTypes.contains(TransactionType.all) ||
        !statuses.contains(TransactionFilterStatus.all) ||
        dateFilterType != null;
  }

  TransactionFilters copyWith({
    Set<TransactionType>? transactionTypes,
    Set<TransactionFilterStatus>? statuses,
    DateFilterType? dateFilterType,
    DateTimeRange? customDateRange,
    bool clearDate = false,
  }) {
    return TransactionFilters(
      transactionTypes: transactionTypes ?? this.transactionTypes,
      statuses: statuses ?? this.statuses,
      dateFilterType:
          clearDate ? null : (dateFilterType ?? this.dateFilterType),
      customDateRange:
          clearDate ? null : (customDateRange ?? this.customDateRange),
    );
  }

  TransactionFilters clear() {
    return TransactionFilters(
      transactionTypes: {TransactionType.all},
      statuses: {TransactionFilterStatus.all},
      dateFilterType: null,
      customDateRange: null,
    );
  }
}

class TransactionFilterBottomSheet extends StatefulWidget {
  final TransactionFilters initialFilters;
  final Function(TransactionFilters) onApplyFilters;

  const TransactionFilterBottomSheet({
    super.key,
    required this.initialFilters,
    required this.onApplyFilters,
  });

  @override
  State<TransactionFilterBottomSheet> createState() =>
      _TransactionFilterBottomSheetState();
}

class _TransactionFilterBottomSheetState
    extends State<TransactionFilterBottomSheet> {
  late Set<TransactionType> _selectedTypes;
  late Set<TransactionFilterStatus> _selectedStatuses;
  late DateFilterType? _selectedDateFilterType;
  late DateTimeRange? _customDateRange;

  bool _isTransactionTypeExpanded = true;
  bool _isStatusExpanded = true;
  bool _isDateExpanded = true;

  @override
  void initState() {
    super.initState();
    _selectedTypes = Set.from(widget.initialFilters.transactionTypes);
    _selectedStatuses = Set.from(widget.initialFilters.statuses);
    _selectedDateFilterType = widget.initialFilters.dateFilterType;
    _customDateRange = widget.initialFilters.customDateRange;
  }

  void _toggleTransactionType(TransactionType type) {
    setState(() {
      if (type == TransactionType.all) {
        _selectedTypes.clear();
        _selectedTypes.add(TransactionType.all);
      } else {
        _selectedTypes.remove(TransactionType.all);
        if (_selectedTypes.contains(type)) {
          _selectedTypes.remove(type);
        } else {
          _selectedTypes.add(type);
        }
      }
      if (_selectedTypes.isEmpty) {
        _selectedTypes.add(TransactionType.all);
      }
    });
  }

  void _toggleStatus(TransactionFilterStatus status) {
    setState(() {
      if (status == TransactionFilterStatus.all) {
        if (_selectedStatuses.contains(TransactionFilterStatus.all)) {
          _selectedStatuses.clear();
          _selectedStatuses.add(TransactionFilterStatus.all);
        } else {
          _selectedStatuses.clear();
          _selectedStatuses.add(TransactionFilterStatus.all);
        }
      } else {
        _selectedStatuses.remove(TransactionFilterStatus.all);
        if (_selectedStatuses.contains(status)) {
          _selectedStatuses.remove(status);
        } else {
          _selectedStatuses.add(status);
        }
      }
      if (_selectedStatuses.isEmpty) {
        _selectedStatuses.add(TransactionFilterStatus.all);
      }
    });
  }

  void _selectDateFilter(DateFilterType type) {
    setState(() {
      if (_selectedDateFilterType == type) {
        _selectedDateFilterType = null;
      } else {
        _selectedDateFilterType = type;
      }
    });
  }

  void _clearAll() {
    setState(() {
      _selectedTypes = {TransactionType.all};
      _selectedStatuses = {TransactionFilterStatus.all};
      _selectedDateFilterType = null;
      _customDateRange = null;
    });
  }

  void _applyFilters() {
    final filters = TransactionFilters(
      transactionTypes: _selectedTypes,
      statuses: _selectedStatuses,
      dateFilterType: _selectedDateFilterType,
      customDateRange: _customDateRange,
    );
    widget.onApplyFilters(filters);
    Navigator.pop(context);
  }

  Future<void> _pickDate(bool isStartDate) async {
    final now = DateTime.now();
    final initialDate =
        isStartDate
            ? (_customDateRange?.start ?? now)
            : (_customDateRange?.end ?? now);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2020),
      lastDate: now,
      builder: (context, child) {
        final colors = Theme.of(context).extension<ColorSystemExtension>()!;
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: colors.brandDefault,
              onPrimary: colors.constantContrast,
              surface: colors.bgB0,
              onSurface: colors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        final currentStart = _customDateRange?.start ?? now;
        final currentEnd = _customDateRange?.end ?? now;

        if (isStartDate) {
          _customDateRange = DateTimeRange(
            start: pickedDate,
            end: pickedDate.isAfter(currentEnd) ? pickedDate : currentEnd,
          );
        } else {
          _customDateRange = DateTimeRange(
            start:
                pickedDate.isBefore(currentStart) ? pickedDate : currentStart,
            end: pickedDate,
          );
        }
      });
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
                  _buildTransactionTypeSection(colors, fonts),
                  _buildStatusSection(colors, fonts),
                  _buildDateSection(colors, fonts),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
          _buildBottomButtons(colors, fonts),
        ],
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
    required ColorSystemExtension colors,
    required AppFontThemeExtension fonts,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: fonts.textLgSemiBold.copyWith(
                color: colors.textPrimary,
                fontSize: 17.sp,
              ),
            ),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: colors.textPrimary,
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckbox({
    required bool isSelected,
    required bool isIndeterminate,
    required ColorSystemExtension colors,
  }) {
    return Container(
      width: 24.w,
      height: 24.h,
      decoration: BoxDecoration(
        color:
            isSelected || isIndeterminate ? colors.brandDefault : colors.bgB0,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color:
              isSelected || isIndeterminate
                  ? colors.brandDefault
                  : colors.gray300,
          width: 2,
        ),
      ),
      child:
          isSelected || isIndeterminate
              ? Icon(
                isIndeterminate ? Icons.remove : Icons.check,
                color: colors.constantContrast,
                size: 16.sp,
              )
              : null,
    );
  }

  Widget _buildTransactionTypeSection(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Column(
      children: [
        _buildSectionHeader(
          title: 'Transaction type',
          isExpanded: _isTransactionTypeExpanded,
          onTap:
              () => setState(
                () => _isTransactionTypeExpanded = !_isTransactionTypeExpanded,
              ),
          colors: colors,
          fonts: fonts,
        ),
        if (_isTransactionTypeExpanded) ...[
          _buildTypeOption('All', TransactionType.all, colors, fonts),
          _buildTypeOption(
            'Contract payment',
            TransactionType.contractPayment,
            colors,
            fonts,
          ),
          _buildTypeOption('Invoice', TransactionType.invoice, colors, fonts),
          _buildTypeOption('Quickpay', TransactionType.quickpay, colors, fonts),
          _buildTypeOption(
            'Withdrawal',
            TransactionType.withdrawal,
            colors,
            fonts,
          ),
        ],
      ],
    );
  }

  Widget _buildTypeOption(
    String label,
    TransactionType type,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    final isSelected = _selectedTypes.contains(type);
    final isAllSelected = _selectedTypes.contains(TransactionType.all);

    return InkWell(
      onTap: () => _toggleTransactionType(type),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: fonts.textMdRegular.copyWith(
                color: colors.textPrimary,
                fontSize: 16.sp,
              ),
            ),
            _buildCheckbox(
              isSelected:
                  type == TransactionType.all ? isAllSelected : isSelected,
              isIndeterminate: false,
              colors: colors,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusSection(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Column(
      children: [
        _buildSectionHeader(
          title: 'Status',
          isExpanded: _isStatusExpanded,
          onTap: () => setState(() => _isStatusExpanded = !_isStatusExpanded),
          colors: colors,
          fonts: fonts,
        ),
        if (_isStatusExpanded) ...[
          _buildStatusOption('All', TransactionFilterStatus.all, colors, fonts),
          _buildStatusOption(
            'Successful',
            TransactionFilterStatus.successful,
            colors,
            fonts,
          ),
          _buildStatusOption(
            'Processing',
            TransactionFilterStatus.processing,
            colors,
            fonts,
          ),
          _buildStatusOption(
            'Failed',
            TransactionFilterStatus.failed,
            colors,
            fonts,
          ),
          SizedBox(height: 16.h),
        ],
      ],
    );
  }

  Widget _buildStatusOption(
    String label,
    TransactionFilterStatus status,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    final isSelected = _selectedStatuses.contains(status);
    final isAllSelected = _selectedStatuses.contains(
      TransactionFilterStatus.all,
    );

    return InkWell(
      onTap: () => _toggleStatus(status),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: fonts.textMdRegular.copyWith(
                color: colors.textPrimary,
                fontSize: 16.sp,
              ),
            ),
            _buildCheckbox(
              isSelected:
                  status == TransactionFilterStatus.all
                      ? isAllSelected
                      : isSelected,
              isIndeterminate: false,
              colors: colors,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSection(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Column(
      children: [
        _buildSectionHeader(
          title: 'Date',
          isExpanded: _isDateExpanded,
          onTap: () => setState(() => _isDateExpanded = !_isDateExpanded),
          colors: colors,
          fonts: fonts,
        ),
        if (_isDateExpanded) ...[
          _buildDateRadioOption(
            'Last 7 days',
            DateFilterType.last7Days,
            colors,
            fonts,
          ),
          _buildDateRadioOption(
            'Last 14 days',
            DateFilterType.last14Days,
            colors,
            fonts,
          ),
          _buildDateRadioOption(
            'Last 30 days',
            DateFilterType.last30Days,
            colors,
            fonts,
          ),
          _buildDateRadioOption('Custom', DateFilterType.custom, colors, fonts),

          if (_selectedDateFilterType == DateFilterType.custom)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
              child: Row(
                children: [
                  Expanded(
                    child: _buildDatePickerField(
                      label: 'From',
                      date: _customDateRange?.start,
                      onTap: () => _pickDate(true),
                      colors: colors,
                      fonts: fonts,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildDatePickerField(
                      label: 'To',
                      date: _customDateRange?.end,
                      onTap: () => _pickDate(false),
                      colors: colors,
                      fonts: fonts,
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(height: 16.h),
        ],
      ],
    );
  }

  Widget _buildDateRadioOption(
    String label,
    DateFilterType type,
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    final isSelected = _selectedDateFilterType == type;

    return InkWell(
      onTap: () => _selectDateFilter(type),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: fonts.textMdRegular.copyWith(
                color: colors.textPrimary,
                fontSize: 16.sp,
              ),
            ),
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? colors.brandDefault : colors.gray300,
                  width: isSelected ? 6 : 2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDatePickerField({
    required String label,
    required DateTime? date,
    required VoidCallback onTap,
    required ColorSystemExtension colors,
    required AppFontThemeExtension fonts,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          border: Border.all(color: colors.gray300),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date != null ? '${date.day}/${date.month}/${date.year}' : label,
              style: fonts.textSmRegular.copyWith(
                color: date != null ? colors.textPrimary : colors.textSecondary,
              ),
            ),
            Icon(
              Icons.calendar_today_outlined,
              size: 16.sp,
              color: colors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButtons(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
      decoration: BoxDecoration(
        color: colors.bgB0,
        border: Border(top: BorderSide(color: colors.strokePrimary, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: _clearAll,
              child: Container(
                height: 52.h,
                decoration: BoxDecoration(
                  color: colors.gray100,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    'Clear all',
                    style: fonts.textMdSemiBold.copyWith(
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
              onTap: _applyFilters,
              child: Container(
                height: 52.h,
                decoration: BoxDecoration(
                  color: colors.brandDefault,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    'Show results',
                    style: fonts.textMdSemiBold.copyWith(
                      color: colors.constantContrast,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
