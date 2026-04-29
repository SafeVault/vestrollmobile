import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/finance_bottom_sheet.dart';
import 'package:vestrollmobile/shared/widgets/bottom_navigation_bar.dart';

class WorkspaceScreen extends StatelessWidget {
  const WorkspaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      appBar: AppBar(
        backgroundColor: colors.bgB1,
        elevation: 0,
        title: Text(
          'Workspace',
          style: fonts.heading3Bold.copyWith(color: colors.textPrimary),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(AppAssets.notificationSvg, colorFilter: ColorFilter.mode(colors.textPrimary!, BlendMode.srcIn)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Features',
              style: fonts.textLgBold.copyWith(color: colors.textPrimary),
            ),
            SizedBox(height: 16.h),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 16.w,
              children: [
                _buildFeatureItem(
                  context,
                  icon: AppAssets.invoiceSvg,
                  label: 'Invoices',
                  color: const Color(0xFF3B82F6),
                  onTap: () => context.pushNamed(RouteConstants.invoicesScreen),
                  fonts: fonts,
                ),
                _buildFeatureItem(
                  context,
                  icon: AppAssets.contractHome,
                  label: 'Estimates',
                  color: const Color(0xFF10B981),
                  onTap: () {},
                  fonts: fonts,
                ),
                _buildFeatureItem(
                  context,
                  icon: AppAssets.contractHome,
                  label: 'Contracts',
                  color: const Color(0xFFF59E0B),
                  onTap: () {},
                  fonts: fonts,
                ),
                _buildFeatureItem(
                  context,
                  icon: AppAssets.people,
                  label: 'Clients',
                  color: const Color(0xFFEC4899),
                  onTap: () {},
                  fonts: fonts,
                ),
                _buildFeatureItem(
                  context,
                  icon: AppAssets.linkSvg,
                  label: 'Payment Links',
                  color: const Color(0xFF8B5CF6),
                  onTap: () {},
                  fonts: fonts,
                ),
                _buildFeatureItem(
                  context,
                  icon: AppAssets.transactionEmpty,
                  label: 'Tax',
                  color: const Color(0xFFEF4444),
                  onTap: () {},
                  fonts: fonts,
                ),
              ],
            ),
            SizedBox(height: 32.h),
            Text(
              'Recent Activity',
              style: fonts.textLgBold.copyWith(color: colors.textPrimary),
            ),
            SizedBox(height: 24.h),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.rocketPng,
                    width: 200.w,
                    height: 200.w,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No data yet',
                    style: fonts.textLgBold.copyWith(color: colors.textPrimary),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Get started by creating your first invoice or contract.',
                    textAlign: TextAlign.center,
                    style: fonts.textSmRegular.copyWith(color: colors.textSecondary),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        onFinanceTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => const FinanceBottomSheet(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: colors.brandDefault,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildFeatureItem(
    BuildContext context, {
    required String icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
    required AppFontThemeExtension fonts,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: icon.endsWith('.svg') ? SvgPicture.asset(
              icon,
              width: 24.w,
              height: 24.w,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ) : Image.asset(
              icon,
              width: 24.w,
              height: 24.w,
              color: color,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: fonts.textSmMedium.copyWith(
              color: Theme.of(context).extension<ColorSystemExtension>()!.textPrimary,
              fontSize: 12.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
