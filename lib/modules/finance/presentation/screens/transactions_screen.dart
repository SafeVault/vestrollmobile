import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/finance/domain/transaction_model.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/date_section_header.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/transaction_filter_bottom_sheet.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/transaction_list_item.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/transactions_empty_state.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final TextEditingController _searchController = TextEditingController();
  TransactionFilters _currentFilters = TransactionFilters();
  String _searchQuery = '';

  final List<Transaction> _transactions = [
    Transaction(
      id: '1',
      title: 'Withdrawal',
      time: '06:30 PM',
      amount: '- 581 USDT',
      status: TransactionStatus.processing,
      iconBackgroundColor: const Color(0xFF3B82F6),
      icon: Icons.account_balance_wallet,
      date: DateTime(2025, 4, 21),
      type: TransactionType.withdrawal,
    ),
    Transaction(
      id: '2',
      title: 'ShopLink Pro UX Audit',
      time: '01:22 PM',
      amount: '+ 581 USDT',
      status: TransactionStatus.successful,
      iconBackgroundColor: const Color(0xFFEC4899),
      icon: Icons.shopping_bag,
      date: DateTime(2025, 4, 21),
      type: TransactionType.contractPayment,
    ),
    Transaction(
      id: '3',
      title: 'Neurolytix Initial consultation',
      time: '09:05 AM',
      amount: '+ 581 USDT',
      status: TransactionStatus.successful,
      iconBackgroundColor: const Color(0xFFF97316),
      icon: Icons.receipt,
      date: DateTime(2025, 4, 21),
      type: TransactionType.invoice,
    ),
    Transaction(
      id: '4',
      title: 'MintForge Bug fixes and updates',
      time: '05:55 PM',
      amount: '+ 581 USDT',
      status: TransactionStatus.successful,
      iconBackgroundColor: const Color(0xFF8B5CF6),
      icon: Icons.bug_report,
      date: DateTime(2025, 4, 21),
      type: TransactionType.quickpay,
    ),
    Transaction(
      id: '5',
      title: 'Brightfolk Payment for project',
      time: '12:10 PM',
      amount: '+ 581 USDT',
      status: TransactionStatus.failed,
      iconBackgroundColor: const Color(0xFFEC4899),
      icon: Icons.payment,
      date: DateTime(2025, 4, 21),
      type: TransactionType.contractPayment,
    ),
    Transaction(
      id: '6',
      title: 'LoopLabs Transfer for services',
      time: '08:15 AM',
      amount: '+ 581 USDT',
      status: TransactionStatus.processing,
      iconBackgroundColor: const Color(0xFFF97316),
      icon: Icons.swap_horiz,
      date: DateTime(2025, 4, 21),
      type: TransactionType.invoice,
    ),
    Transaction(
      id: '7',
      title: 'Quikdash Reimbursement',
      time: '06:30 PM',
      amount: '+ 581 USDT',
      status: TransactionStatus.successful,
      iconBackgroundColor: const Color(0xFF8B5CF6),
      icon: Icons.account_balance,
      date: DateTime(2025, 4, 19),
      type: TransactionType.quickpay,
    ),
    Transaction(
      id: '8',
      title: 'Paylite Payment for project',
      time: '01:22 PM',
      amount: '+ 581 USDT',
      status: TransactionStatus.failed,
      iconBackgroundColor: const Color(0xFFEC4899),
      icon: Icons.credit_card,
      date: DateTime(2025, 4, 19),
      type: TransactionType.contractPayment,
    ),
    Transaction(
      id: '9',
      title: 'NovaWorks UI/UX Design',
      time: '09:05 AM',
      amount: '+ 581 USDT',
      status: TransactionStatus.processing,
      iconBackgroundColor: const Color(0xFFF97316),
      icon: Icons.design_services,
      date: DateTime(2025, 4, 19),
      type: TransactionType.invoice,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      _searchQuery = _searchController.text.toLowerCase();
    });
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => TransactionFilterBottomSheet(
            initialFilters: _currentFilters,
            onApplyFilters: (filters) {
              setState(() {
                _currentFilters = filters;
              });
            },
          ),
    );
  }

  List<Transaction> _getFilteredTransactions() {
    return _transactions.where((transaction) {
      if (_searchQuery.isNotEmpty) {
        if (!transaction.title.toLowerCase().contains(_searchQuery) &&
            !transaction.amount.toLowerCase().contains(_searchQuery)) {
          return false;
        }
      }

      if (!_currentFilters.transactionTypes.contains(TransactionType.all)) {
        if (!_currentFilters.transactionTypes.contains(transaction.type)) {
          return false;
        }
      }

      if (!_currentFilters.statuses.contains(TransactionFilterStatus.all)) {
        final filterStatus = _mapTransactionStatusToFilterStatus(
          transaction.status,
        );
        if (!_currentFilters.statuses.contains(filterStatus)) {
          return false;
        }
      }

      if (_currentFilters.dateRange != null) {
        final dateRange = _currentFilters.dateRange!;
        final start = DateTime(
          dateRange.start.year,
          dateRange.start.month,
          dateRange.start.day,
        );
        final end = DateTime(
          dateRange.end.year,
          dateRange.end.month,
          dateRange.end.day,
          23,
          59,
          59,
        );

        if (transaction.date.isBefore(start) || transaction.date.isAfter(end)) {
          return false;
        }
      }

      return true;
    }).toList();
  }

  TransactionFilterStatus _mapTransactionStatusToFilterStatus(
    TransactionStatus status,
  ) {
    switch (status) {
      case TransactionStatus.successful:
        return TransactionFilterStatus.successful;
      case TransactionStatus.processing:
        return TransactionFilterStatus.processing;
      case TransactionStatus.failed:
        return TransactionFilterStatus.failed;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final displayTransactions = _getFilteredTransactions();

    return Scaffold(
      backgroundColor: isDark ? colors.bgB0 : colors.bgB1,
      appBar: VestrollAppBar(
        title: 'Transactions',
        isBack: true,
        actions: const [],
      ),
      body: Column(
        children: [
          _buildSearchBar(colors, fonts),
          Expanded(
            child:
                displayTransactions.isEmpty
                    ? const TransactionsEmptyState()
                    : _buildTransactionsList(displayTransactions, colors),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 44.h,
              decoration: BoxDecoration(
                color: colors.bgB0,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: colors.strokePrimary),
              ),
              child: TextField(
                controller: _searchController,
                style: fonts.textMdRegular.copyWith(
                  color: colors.textPrimary,
                  fontSize: 15.sp,
                ),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: fonts.textMdRegular.copyWith(
                    color: colors.textTertiary,
                    fontSize: 15.sp,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: colors.textTertiary,
                    size: 20.sp,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: _showFilterBottomSheet,
            child: Container(
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: colors.bgB0,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: colors.strokePrimary),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(Icons.tune, color: colors.textPrimary, size: 20.sp),
                  if (_currentFilters.hasActiveFilters)
                    Positioned(
                      top: 8.h,
                      right: 8.w,
                      child: Container(
                        width: 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: colors.brandDefault,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionsList(
    List<Transaction> transactions,
    ColorSystemExtension colors,
  ) {
    final groupedTransactions = <String, List<Transaction>>{};

    for (final transaction in transactions) {
      final dateKey = _formatDate(transaction.date);
      if (!groupedTransactions.containsKey(dateKey)) {
        groupedTransactions[dateKey] = [];
      }
      groupedTransactions[dateKey]!.add(transaction);
    }

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      color: colors.brandDefault,
      backgroundColor: colors.bgB0,
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 16.h),
        itemCount: groupedTransactions.length * 2,
        itemBuilder: (context, index) {
          final groupIndex = index ~/ 2;
          final isHeader = index % 2 == 0;

          final dateKey = groupedTransactions.keys.elementAt(groupIndex);

          if (isHeader) {
            return DateSectionHeader(date: dateKey);
          } else {
            final transactionsForDate = groupedTransactions[dateKey]!;
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: colors.bgB0,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children:
                    transactionsForDate.map((transaction) {
                      return TransactionListItem(
                        transaction: transaction,
                        onTap: () {},
                      );
                    }).toList(),
              ),
            );
          }
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final transactionDate = DateTime(date.year, date.month, date.day);

    if (transactionDate == today) {
      return 'Today';
    } else if (transactionDate == today.subtract(const Duration(days: 1))) {
      return 'Yesterday';
    } else {
      final months = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ];
      return '${date.day} ${months[date.month - 1]} ${date.year}';
    }
  }
}
