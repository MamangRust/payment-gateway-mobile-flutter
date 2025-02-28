class DashboardCard {
  final double? totalBalance;
  final double? totalTopup;
  final double? totalWithdraw;
  final double? totalTransaction;
  final double? totalTransfer;

  DashboardCard({
    this.totalBalance,
    this.totalTopup,
    this.totalWithdraw,
    this.totalTransaction,
    this.totalTransfer,
  });

  factory DashboardCard.fromJson(Map<String, dynamic> json) {
    return DashboardCard(
      totalBalance: (json['total_balance'] as num?)?.toDouble(),
      totalTopup: (json['total_topup'] as num?)?.toDouble(),
      totalWithdraw: (json['total_withdraw'] as num?)?.toDouble(),
      totalTransaction: (json['total_transaction'] as num?)?.toDouble(),
      totalTransfer: (json['total_transfer'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_balance': totalBalance,
      'total_topup': totalTopup,
      'total_withdraw': totalWithdraw,
      'total_transaction': totalTransaction,
      'total_transfer': totalTransfer,
    };
  }
}
