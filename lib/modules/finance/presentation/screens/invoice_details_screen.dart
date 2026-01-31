import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vestrollmobile/core/utils/assets_folder/assets.dart';
import 'package:vestrollmobile/core/utils/themes_colors/app_color_extension.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/payment_details_widgets.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  const InvoiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<ColorSystemExtension>()!;

    return Scaffold(
      backgroundColor: colors.bgB1,
      appBar: const VestrollAppBar(title: 'Invoice', isBack: true, actions: []),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            PaymentDetailsHeader(
              amount: '581',
              currency: 'USDT',
              approxValue: '\$476.19',
              assetPath: AppAssets.invoiceSvg,
              iconBackgroundColor: const Color(0xFFF97316),
            ),
            SizedBox(height: 16.h),
            PaymentStatusCard(
              status: 'Overdue',
              estArrivalDate: '20 April 2025',
              network: 'Ethereum',
              networkIcon: _buildEthereumIcon(),
              isOverdue: true,
            ),
            SizedBox(height: 16.h),
            PaymentInfoSection(
              items: [
                PaymentInfoItem(
                  label: 'Invoice',
                  value: '#INV-2025-001',
                  showOpenIcon: true,
                ),
                PaymentInfoItem(
                  label: 'Title',
                  value: 'ShopLink Pro UX Audit feedb...',
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
                  title: 'Invoice created and sent to client',
                  subtitle: '20 April 2025, 04:40 PM',
                  isCompleted: true,
                ),
                TimelineStep(
                  title: 'Client payment overdue',
                  description:
                      'The payment was expected by 31 May 2025 but has not yet been received.',
                  isActive: true,
                  activeIcon: Icons.warning_amber_rounded,
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
