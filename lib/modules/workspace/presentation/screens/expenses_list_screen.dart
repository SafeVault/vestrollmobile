import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/shared/widgets/primary_button.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class ExpensesListScreen extends StatefulWidget {
  const ExpensesListScreen({super.key});

  @override
  State<ExpensesListScreen> createState() => _ExpensesListScreenState();
}

class _ExpensesListScreenState extends State<ExpensesListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      appBar: VestrollAppBar(
        title: 'Expenses',
        isBack: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search_rounded, color: colors.textPrimary),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_list_rounded, color: colors.textPrimary),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildTabBar(colors, fonts),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildExpensesList(colors, fonts, showAll: true),
                _buildExpensesList(colors, fonts, showAll: false),
              ],
            ),
          ),
          _buildBottomAction(context, colors),
        ],
      ),
    );
  }

  Widget _buildTabBar(ColorSystemExtension colors, AppFontThemeExtension fonts) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: colors.bgB0,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: colors.strokePrimary),
      ),
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: colors.brandDefault,
          borderRadius: BorderRadius.circular(8.r),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: colors.textTertiary,
        labelStyle: fonts.textSmBold,
        unselectedLabelStyle: fonts.textSmMedium,
        tabs: const [
          Tab(text: 'All'),
          Tab(text: 'Awaiting approval'),
        ],
      ),
    );
  }

  Widget _buildExpensesList(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts, {
    required bool showAll,
  }) {
    // Mock data based on screenshot
    final List<Map<String, dynamic>> expenses = [
      {
        'title': 'Macbook Mobile & Web App Redesign',
        'category': 'Software / Tools',
        'amount': '10 USDT',
        'status': 'Paid',
      },
      {
        'title': 'Freelance Design Tool License',
        'category': 'Software / Tools',
        'amount': '25 USDT',
        'status': 'Awaiting Approval',
      },
      {
        'title': 'Business Card Printing',
        'category': 'Office Supplies',
        'amount': '15 USDT',
        'status': 'Declined',
      },
      {
        'title': 'Uber Floating for Project meeting',
        'category': 'Travel',
        'amount': '8 USDT',
        'status': 'Approved',
      },
    ];

    final filteredExpenses =
        showAll
            ? expenses
            : expenses
                .where((e) => e['status'] == 'Awaiting Approval')
                .toList();

    if (filteredExpenses.isEmpty) {
      return _buildEmptyState(colors, fonts);
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      itemCount: filteredExpenses.length,
      separatorBuilder: (context, index) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final expense = filteredExpenses[index];
        return _ExpenseCard(
          expense: expense,
          colors: colors,
          fonts: fonts,
          onTap: () {
            context.pushNamed(RouteConstants.expenseDetails);
          },
        );
      },
    );
  }

  Widget _buildEmptyState(
    ColorSystemExtension colors,
    AppFontThemeExtension fonts,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.receipt_long_rounded,
          size: 64.sp,
          color: colors.textTertiary.withOpacity(0.2),
        ),
        SizedBox(height: 16.h),
        Text(
          'No expenses yet',
          style: fonts.textMdBold.copyWith(color: colors.textPrimary),
        ),
        SizedBox(height: 8.h),
        Text(
          'Submit and track your project-related costs easily',
          style: fonts.textSmRegular.copyWith(color: colors.textTertiary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildBottomAction(BuildContext context, ColorSystemExtension colors) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 32.h),
      decoration: BoxDecoration(
        color: colors.bgB0,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: PrimaryButton(
        text: 'Add expense',
        onPressed: () {
          context.pushNamed(RouteConstants.addExpense);
        },
      ),
    );
  }
}

class _ExpenseCard extends StatelessWidget {
  final Map<String, dynamic> expense;
  final ColorSystemExtension colors;
  final AppFontThemeExtension fonts;
  final VoidCallback onTap;

  const _ExpenseCard({
    required this.expense,
    required this.colors,
    required this.fonts,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: colors.bgB0,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: colors.strokePrimary),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense['title'],
                    style: fonts.textSmBold.copyWith(color: colors.textPrimary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    expense['category'],
                    style: fonts.textXsRegular.copyWith(
                      color: colors.textTertiary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  expense['amount'],
                  style: fonts.textSmBold.copyWith(color: colors.textPrimary),
                ),
                SizedBox(height: 4.h),
                _buildStatusBadge(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusBadge() {
    Color color;
    switch (expense['status']) {
      case 'Paid':
        color = const Color(0xFF22C55E);
        break;
      case 'Awaiting Approval':
        color = const Color(0xFFF97316);
        break;
      case 'Declined':
        color = const Color(0xFFEF4444);
        break;
      case 'Approved':
        color = const Color(0xFF3B82F6);
        break;
      default:
        color = colors.textTertiary;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        expense['status'],
        style: fonts.textXsMedium.copyWith(
          color: color,
          fontSize: 10.sp,
        ),
      ),
    );
  }
}
