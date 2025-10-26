// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vestrollmobile/core/navigation/routes_constant.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
import 'package:vestrollmobile/core/utils/managers/config.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/identity_and_multifactor/presentation/widgets/account_type_card.dart';
import 'package:vestrollmobile/shared/widgets/primary_button.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class AccountTypeScreen extends StatefulWidget {
  const AccountTypeScreen({super.key});

  @override
  State<AccountTypeScreen> createState() => _AccountTypeScreenState();
}

class _AccountTypeScreenState extends State<AccountTypeScreen> {
  String? selectedAccountType;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(context.screenWidth(), 60),
        child: const VestrollAppBar(isBack: true, title: ''),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 4,
              width: double.infinity,
              color: Colors.grey[200],
              alignment: Alignment.centerLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 4,
                decoration: BoxDecoration(
                  color: colors.activeButton,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Account Type',
                      style: fonts.heading2Bold.copyWith(
                        fontSize: 24.sp,
                        color: colors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Choose whether you're registering as a freelancer, contractor or a business entity.",
                      style: fonts.bodyMedium.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: colors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    AccountTypeCard(
                      icon: AppAssets.userCircle,
                      title: 'Freelancer account',
                      description:
                          'You work independently, manage your own contracts and payments directly with clients.',
                      isSelected: selectedAccountType == 'freelancer',
                      onTap: () {
                        setState(() {
                          selectedAccountType = 'freelancer';
                        });
                      },
                    ),
                    SizedBox(height: 10.h),
                    AccountTypeCard(
                      icon: AppAssets.briefCase,
                      title: 'Contractor account',
                      description:
                          'You\'re contracted to work for a company or organization on specific projects or terms.',
                      isSelected: selectedAccountType == 'contractor',
                      onTap: () {
                        setState(() {
                          selectedAccountType = 'contractor';
                        });
                      },
                    ),
                    SizedBox(height: 10.h),
                    AccountTypeCard(
                      icon: AppAssets.buildingOfficeSvg,
                      title: 'Business/Corporate account',
                      description:
                          'You represent a business that manages contracts on behalf of multiple team members.',
                      badge: 'Coming soon',
                      isEnabled: false,
                      isSelected: false,
                      onTap: () {},
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: PrimaryButton(
                text: 'Continue',
                isEnabled: selectedAccountType != null,
                onPressed:
                    selectedAccountType != null
                        ? () {
                          context.pushNamed(RouteConstants.personalDetails);
                        }
                        : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
