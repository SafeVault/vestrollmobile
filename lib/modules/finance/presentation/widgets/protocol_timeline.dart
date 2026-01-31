import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum TimelineStatus { completed, active, pending, empty, warning }

class TimelineItemData {
  final String title;
  final String? subtitle;
  final TimelineStatus status;

  TimelineItemData({required this.title, this.subtitle, required this.status});
}

class ProtocolTimeline extends StatelessWidget {
  final List<TimelineItemData> items;

  const ProtocolTimeline({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(items.length, (index) {
        return ProtocolTimelineItem(
          data: items[index],
          isLast: index == items.length - 1,
          isNextCompleted:
              index < items.length - 1 &&
              items[index + 1].status == TimelineStatus.completed,
        );
      }),
    );
  }
}

class ProtocolTimelineItem extends StatelessWidget {
  final TimelineItemData data;
  final bool isLast;
  final bool isNextCompleted;

  const ProtocolTimelineItem({
    super.key,
    required this.data,
    required this.isLast,
    this.isNextCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIndicator(context),
          SizedBox(width: 16.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1F2937),
                    ),
                  ),
                  if (data.subtitle != null) ...[
                    SizedBox(height: 4.h),
                    Text(
                      data.subtitle!,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: const Color(0xFF6B7280),
                        height: 1.5,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(BuildContext context) {
    return Column(
      children: [
        _buildIcon(),
        if (!isLast)
          Expanded(
            child: CustomPaint(
              size: Size(1.w, double.infinity),
              painter: TimelineLinePainter(
                color: _getLineColor(),
                isDotted: _isLineDotted(),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildIcon() {
    switch (data.status) {
      case TimelineStatus.completed:
        return Container(
          width: 20.sp,
          height: 20.sp,
          decoration: const BoxDecoration(
            color: Color(0xFF10B981),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, color: Colors.white, size: 12.sp),
        );
      case TimelineStatus.active:
        return Container(
          width: 20.sp,
          height: 20.sp,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFF97316), width: 1.5),
          ),
          child: Center(
            child: Icon(
              Icons.access_time,
              color: const Color(0xFFF97316),
              size: 10.sp,
            ),
          ),
        );
      case TimelineStatus.warning:
        return Container(
          width: 20.sp,
          height: 20.sp,
          child: Icon(
            Icons.warning_amber_rounded,
            color: const Color(0xFFF97316),
            size: 20.sp,
          ),
        );
      case TimelineStatus.pending:
      case TimelineStatus.empty:
        return CustomPaint(
          size: Size(20.sp, 20.sp),
          painter: DottedCirclePainter(
            color: const Color(0xFFD1D5DB),
            strokeWidth: 1.5,
          ),
        );
    }
  }

  Color _getLineColor() {
    if (data.status == TimelineStatus.completed && isNextCompleted) {
      return const Color(0xFF10B981).withOpacity(0.3);
    }
    return const Color(0xFFE5E7EB);
  }

  bool _isLineDotted() {
    return data.status != TimelineStatus.completed;
  }
}

class TimelineLinePainter extends CustomPainter {
  final Color color;
  final bool isDotted;

  TimelineLinePainter({required this.color, required this.isDotted});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = size.width
          ..strokeCap = StrokeCap.round;

    if (!isDotted) {
      canvas.drawLine(
        Offset(size.width / 2, 0),
        Offset(size.width / 2, size.height),
        paint,
      );
    } else {
      const double dashHeight = 4;
      const double dashSpace = 4;
      double startY = 0;
      while (startY < size.height) {
        canvas.drawLine(
          Offset(size.width / 2, startY),
          Offset(size.width / 2, startY + dashHeight),
          paint,
        );
        startY += dashHeight + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class DottedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  DottedCirclePainter({required this.color, required this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;

    final double radius = (size.width - strokeWidth) / 2;
    final center = Offset(size.width / 2, size.height / 2);

    const double dashAngle = 0.2; // roughly 12 degrees
    const double spaceAngle = 0.2;

    double currentAngle = 0;
    while (currentAngle < 2 * 3.14159) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        currentAngle,
        dashAngle,
        false,
        paint,
      );
      currentAngle += dashAngle + spaceAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
