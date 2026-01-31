import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/payment_details_widgets.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class ContractPaymentDetailsScreen extends StatelessWidget {
  const ContractPaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      appBar: const VestrollAppBar(
        title: 'Contract payment',
        isBack: true,
        actions: [],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            const PaymentDetailsHeader(
              amount: '581',
              currency: 'USDT',
              approxValue: '\$476.19',
              assetPath: AppAssets.wallet,
              iconBackgroundColor: const Color(0xFF8B5CF6),
            ),
            SizedBox(height: 16.h),
            PaymentStatusCard(
              status: 'Coming in 2 days',
              estArrivalDate: '20 April 2025',
              network: 'Ethereum',
              networkIcon: _buildEthereumIcon(),
              isOverdue: false,
            ),
            SizedBox(height: 16.h),
            PaymentInfoSection(
              items: [
                PaymentInfoItem(
                  label: 'Contract',
                  value: 'MintForge Bug fixes and...',
                  showOpenIcon: true,
                ),
                PaymentInfoItem(label: 'Contract type', value: 'Fixed Rate'),
                PaymentInfoItem(
                  label: 'Invoice',
                  value: '#INV-2025-001',
                  showOpenIcon: true,
                ),
                PaymentInfoItem(
                  label: 'Client',
                  value: 'Adegboyega Oluwagbemiro',
                ),
              ],
            ),
            SizedBox(height: 16.h),
            PaymentTimeline(
              steps: [
                TimelineStep(
                  title: 'Contract cycle completed',
                  subtitle: '20 April 2025, 04:40 PM',
                  isCompleted: true,
                ),
                TimelineStep(
                  title: 'Client approved contract cycle',
                  subtitle: '20 April 2025, 04:40 PM',
                  isCompleted: true,
                ),
                TimelineStep(
                  title: 'Invoice created for this cycle',
                  subtitle: '20 April 2025, 04:40 PM',
                  isCompleted: true,
                ),
                TimelineStep(
                  title: 'Awaiting payment confirmation',
                  description:
                      'Your client will get invoice access 10 days before it is due.',
                  isActive: true,
                  activeIcon: Icons.access_time_rounded,
                  activeIconColor: const Color(0xFFF97316),
                ),
                TimelineStep(title: 'Process your client payment'),
                TimelineStep(
                  title:
                      'According to your invoice, funds should be reflected in your balance on 31 May 2025.',
                ),
              ],
            ),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  Widget _buildEthereumIcon() {
    return SvgPicture.asset(
      AppAssets.ethereumIcon,
      width: 24.sp,
      height: 24.sp,
    );
  }
}
