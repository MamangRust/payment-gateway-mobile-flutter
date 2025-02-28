import 'package:mobile/model/card/dashboard_card.dart';

class DashboardCardCardNumber extends DashboardCard {
  final double? totalTransferSend;
  final double? totalTransferReceiver;

  DashboardCardCardNumber({
    double? totalBalance,
    double? totalTopup,
    double? totalWithdraw,
    double? totalTransaction,
    double? totalTransfer,
    this.totalTransferSend,
    this.totalTransferReceiver,
  }) : super(
          totalBalance: totalBalance,
          totalTopup: totalTopup,
          totalWithdraw: totalWithdraw,
          totalTransaction: totalTransaction,
          totalTransfer: totalTransfer,
        );

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

  @override
  Map<String, dynamic> toJson() {
    final json = super.toJson();
    json['total_transfer_send'] = totalTransferSend;
    json['total_transfer_receiver'] = totalTransferReceiver;
    return json;
  }
}
