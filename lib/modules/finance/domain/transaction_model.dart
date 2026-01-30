import 'package:flutter/material.dart';

enum TransactionStatus { successful, processing, failed }

enum TransactionType { all, contractPayment, invoice, quickpay, withdrawal }

class Transaction {
  final String id;
  final String title;
  final String time;
  final String amount;
  final TransactionStatus status;
  final Color iconBackgroundColor;
  final IconData icon;
  final DateTime date;
  final TransactionType type;

  const Transaction({
    required this.id,
    required this.title,
    required this.time,
    required this.amount,
    required this.status,
    required this.iconBackgroundColor,
    required this.icon,
    required this.date,
    required this.type,
  });

  Color getStatusColor() {
    switch (status) {
      case TransactionStatus.successful:
        return const Color(0xFF22C55E);
      case TransactionStatus.processing:
        return const Color(0xFFF97316);
      case TransactionStatus.failed:
        return const Color(0xFFEF4444);
    }
  }

  String getStatusText() {
    switch (status) {
      case TransactionStatus.successful:
        return 'Successful';
      case TransactionStatus.processing:
        return 'Processing';
      case TransactionStatus.failed:
        return 'Failed';
    }
  }
}
