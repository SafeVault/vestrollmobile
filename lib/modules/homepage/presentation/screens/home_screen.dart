import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/account_setup_card.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/balance_card.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/empty_state_section.dart';
import 'package:vestrollmobile/modules/homepage/presentation/widgets/quick_action_section.dart';
import 'package:vestrollmobile/shared/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome! 👋',
                          style: fonts.bodyMedium.copyWith(
                            fontSize: 14.sp,
                            color: colors.textSecondary,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Adebisi Adeyemi',
                          style: fonts.heading2Bold.copyWith(
                            fontSize: 20.sp,
                            color: colors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 40.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: colors.bgB0,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: SvgPicture.asset(AppAssets.notificationHome),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TotalBalanceCard(
                  balance: 0.00,
                  percentageChange: -0.00,
                  amountChange: 0.00,
                  onTap: () {},
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: AccountSetupCard(progress: 0.2, onTap: () {}),
              ),

              SizedBox(height: 24.h),
              const QuickActionsSection(),
              SizedBox(height: 24.h),
              EmptyStateSection(
                assetImage: AppAssets.contractEmpty,
                title: 'Contracts',
                onSeeAll: () {
                  // context.pushNamed(RouteConstants.contracts);
                },
              ),
              SizedBox(height: 24.h),
              EmptyStateSection(
                assetImage: AppAssets.transactionEmpty,
                title: 'Transactions',
                onSeeAll: () {
                  // context.pushNamed(RouteConstants.transactions);
                },
              ),
              SizedBox(height: 24.h),
              // Upcoming Payments Section
              EmptyStateSection(
                assetImage: AppAssets.transactionEmpty,
                title: 'Upcoming payments',
                onSeeAll: () {
                  // context.pushNamed(RouteConstants.upcomingPayments);
                },
              ),
              SizedBox(height: 26.h), // Space for bottom nav
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
