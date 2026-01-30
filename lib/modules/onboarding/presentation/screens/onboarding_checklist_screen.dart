import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_font_theme_extension.dart';
import 'package:vestrollmobile/modules/onboarding/domain/onboarding_model.dart';
import 'package:vestrollmobile/modules/onboarding/presentation/widgets/onboarding_progress_bar.dart';
import 'package:vestrollmobile/modules/onboarding/presentation/widgets/onboarding_step_item.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class OnboardingChecklistScreen extends StatefulWidget {
  final bool isContractor;

  const OnboardingChecklistScreen({super.key, this.isContractor = true});

  @override
  State<OnboardingChecklistScreen> createState() =>
      _OnboardingChecklistScreenState();
}

class _OnboardingChecklistScreenState extends State<OnboardingChecklistScreen> {
  late List<OnboardingStep> _steps;

  @override
  void initState() {
    super.initState();
    _steps = [
      OnboardingStep(
        title:
            'Create ${widget.isContractor ? 'contractor' : 'freelancer'} account',
        status: OnboardingStatus.completed,
        icon: Icons.account_circle_outlined,
      ),
      const OnboardingStep(
        title: 'Verify your identity',
        status: OnboardingStatus.todo,
        icon: Icons.assignment_ind_outlined,
      ),
      const OnboardingStep(
        title: 'Provide your BVN',
        status: OnboardingStatus.todo,
        icon: Icons.account_balance_outlined,
      ),
      const OnboardingStep(
        title: 'Add tax info for compliance',
        status: OnboardingStatus.todo,
        icon: Icons.balance_outlined,
      ),
      const OnboardingStep(
        title: 'Fund wallet with tokens',
        status: OnboardingStatus.todo,
        icon: Icons.account_balance_wallet_outlined,
      ),
    ];
  }

  double get _progress {
    final completedCount =
        _steps.where((s) => s.status == OnboardingStatus.completed).length;
    return completedCount / _steps.length;
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;
    final fonts = Theme.of(context).extension<AppFontThemeExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB0,
      appBar: VestrollAppBar(
        isBack: true,
        centerTitle: false,
        actions: const [],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              'Onboarding Checklist',
              style: fonts.heading1Bold.copyWith(
                color: colors.textPrimary,
                fontSize: 28.sp,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'You must complete all steps to fully activate your account.',
              style: fonts.textMdRegular.copyWith(
                color: colors.textSecondary,
                height: 1.5,
              ),
            ),
            SizedBox(height: 32.h),
            OnboardingProgressBar(progress: _progress),
            SizedBox(height: 40.h),
            ..._steps.map(
              (step) => OnboardingStepItem(
                step: step,
                onTap: () {
                  // Handle navigation to step
                },
              ),
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
