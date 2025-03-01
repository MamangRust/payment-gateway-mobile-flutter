class DashboardCardCardNumber {
  final double? totalBalance;
  final double? totalTopup;
  final double? totalWithdraw;
  final double? totalTransaction;
  final double? totalTransfer;
  final double? totalTransferSend;
  final double? totalTransferReceiver;

  DashboardCardCardNumber({
    this.totalBalance,
    this.totalTopup,
    this.totalWithdraw,
    this.totalTransaction,
    this.totalTransfer,
    this.totalTransferSend,
    this.totalTransferReceiver,
  });

  factory DashboardCardCardNumber.fromJson(Map<String, dynamic> json) {
    return DashboardCardCardNumber(
      totalBalance: (json['total_balance'] as num?)?.toDouble(),
      totalTopup: (json['total_topup'] as num?)?.toDouble(),
      totalWithdraw: (json['total_withdraw'] as num?)?.toDouble(),
      totalTransaction: (json['total_transaction'] as num?)?.toDouble(),
      totalTransfer: (json['total_transfer'] as num?)?.toDouble(),
      totalTransferSend: (json['total_transfer_send'] as num?)?.toDouble(),
      totalTransferReceiver:
          (json['total_transfer_receiver'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total_balance': totalBalance,
      'total_topup': totalTopup,
      'total_withdraw': totalWithdraw,
      'total_transaction': totalTransaction,
      'total_transfer': totalTransfer,
      'total_transfer_send': totalTransferSend,
      'total_transfer_receiver': totalTransferReceiver,
    };
  }
}
