import 'package:flutter/material.dart';

enum UpcomingPaymentStatus { inDays, overdue }

enum PaymentType { contract, invoice }

class UpcomingPayment {
  final String id;
  final String title;
  final String amount;
  final String currency;
  final DateTime estimatedDate;
  final UpcomingPaymentStatus status;
  final int? daysRemaining; // For "In X days"
  final Color iconBackgroundColor;
  final IconData icon;
  final PaymentType type;

  const UpcomingPayment({
    required this.id,
    required this.title,
    required this.amount,
    required this.currency,
    required this.estimatedDate,
    required this.status,
    this.daysRemaining,
    required this.iconBackgroundColor,
    required this.icon,
    required this.type,
  });

  String get amountWithCurrency => '$amount $currency';
}
