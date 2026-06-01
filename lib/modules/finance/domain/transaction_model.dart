enum TransactionStatus { successful, processing, failed }

enum TransactionType { all, contractPayment, invoice, quickpay, withdrawal }

class Transaction {
  final String id;
  final String title;
  final String time;
  final String amount;
  final TransactionStatus status;
  final String iconBackgroundColor;
  final String icon;
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

  String getStatusColor() {
    switch (status) {
      case TransactionStatus.successful:
        return '#22C55E';
      case TransactionStatus.processing:
        return '#F97316';
      case TransactionStatus.failed:
        return '#EF4444';
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
