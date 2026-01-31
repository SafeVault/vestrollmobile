import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vestrollmobile/modules/finance/presentation/widgets/protocol_timeline.dart';
import 'package:vestrollmobile/shared/widgets/vestroll_app_bar.dart';

class TimelineShowcaseScreen extends StatelessWidget {
  const TimelineShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VestrollAppBar(isBack: true, centerTitle: false),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            _buildMilestoneVariations(),
            SizedBox(height: 40.h),
            _buildContractCycleVariations(),
          ],
        ),
      ),
    );
  }

  Widget _buildMilestoneVariations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Milestone Progress Variations',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 16.h),
        _TimelineShowcaseCard(
          items: [
            TimelineItemData(
              title: 'Milestone completion submitted',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Awaiting client approval',
              subtitle: 'Payment is linked to the approval of your submission',
              status: TimelineStatus.active,
            ),
            TimelineItemData(
              title: 'Invoice created for this submission',
              subtitle: 'An invoice will be created for this milestone',
              status: TimelineStatus.pending,
            ),
            TimelineItemData(
              title: 'Awaiting payment confirmation',
              subtitle: 'Your client will get access to your invoice.',
              status: TimelineStatus.pending,
            ),
            TimelineItemData(
              title: 'Process your client payment',
              status: TimelineStatus.empty,
            ),
            TimelineItemData(
              title:
                  'According to your contract, funds should be reflected in your balance on 31 May 2025',
              status: TimelineStatus.empty,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        _TimelineShowcaseCard(
          items: [
            TimelineItemData(
              title: 'Milestone completion submitted',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Client approved submission',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Invoice created for this submission',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Awaiting payment confirmation',
              subtitle: 'Your client has access to your invoice.',
              status: TimelineStatus.active,
            ),
            TimelineItemData(
              title: 'Process your client payment',
              status: TimelineStatus.empty,
            ),
            TimelineItemData(
              title:
                  'According to your contract, funds should be reflected in your balance on 31 May 2025',
              status: TimelineStatus.empty,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        _TimelineShowcaseCard(
          items: [
            TimelineItemData(
              title: 'Milestone completion submitted',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Client approved submission',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Invoice created for this submission',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Client payment confirmed',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Processing your client payment',
              subtitle: 'We are processing your client payment',
              status: TimelineStatus.active,
            ),
            TimelineItemData(
              title:
                  'According to your contract, funds should be reflected in your balance on 31 May 2025',
              status: TimelineStatus.empty,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        _TimelineShowcaseCard(
          items: [
            TimelineItemData(
              title: 'Milestone completion submitted',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Client approved submission',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Invoice created for this submission',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Client payment confirmed',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Client payment processed',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Funds received in your account',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContractCycleVariations() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contract Cycle Variations',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        SizedBox(height: 16.h),
        _TimelineShowcaseCard(
          items: [
            TimelineItemData(
              title: 'Contract cycle completed',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Awaiting client approval',
              subtitle:
                  'Payment is linked to the approval of your current contract cycle.',
              status: TimelineStatus.active,
            ),
            TimelineItemData(
              title: 'Invoice created for this cycle',
              subtitle: 'An invoice will be created for this contract cycle.',
              status: TimelineStatus.pending,
            ),
            TimelineItemData(
              title: 'Awaiting payment confirmation',
              subtitle:
                  'Your client will get access to your invoice in 12 days before the due.',
              status: TimelineStatus.pending,
            ),
            TimelineItemData(
              title: 'Process your client payment',
              status: TimelineStatus.empty,
            ),
            TimelineItemData(
              title:
                  'According to your contract, funds should be reflected in your balance on 31 May 2025',
              status: TimelineStatus.empty,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        _TimelineShowcaseCard(
          items: [
            TimelineItemData(
              title: 'Contract cycle completed',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Client approved contract cycle',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Invoice created for this cycle',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Awaiting payment confirmation',
              subtitle:
                  'Your client will get access to your invoice in 12 days before the due.',
              status: TimelineStatus.active,
            ),
            TimelineItemData(
              title: 'Process your client payment',
              status: TimelineStatus.empty,
            ),
            TimelineItemData(
              title:
                  'According to your contract, funds should be reflected in your balance on 31 May 2025',
              status: TimelineStatus.empty,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        _TimelineShowcaseCard(
          items: [
            TimelineItemData(
              title: 'Contract cycle completed',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Client approved contract cycle',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Invoice created for this cycle',
              subtitle: '20 April 2025, 04:40 PM',
              status: TimelineStatus.completed,
            ),
            TimelineItemData(
              title: 'Client payment overdue',
              subtitle:
                  'The payment was scheduled for 31 May 2025 but has not yet been received.',
              status: TimelineStatus.warning,
            ),
            TimelineItemData(
              title: 'Process your client payment',
              status: TimelineStatus.empty,
            ),
            TimelineItemData(
              title:
                  'According to your contract, funds should be reflected in your balance on 31 May 2025',
              status: TimelineStatus.empty,
            ),
          ],
        ),
      ],
    );
  }
}

class _TimelineShowcaseCard extends StatelessWidget {
  final List<TimelineItemData> items;

  const _TimelineShowcaseCard({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ProtocolTimeline(items: items),
    );
  }
}
