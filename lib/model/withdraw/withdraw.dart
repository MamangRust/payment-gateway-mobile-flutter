class Withdraw {
  final int withdrawId;
  final String cardNumber;
  final double withdrawAmount;
  final DateTime withdrawTime;
  final String createdAt;
  final String updatedAt;

  Withdraw({
    required this.withdrawId,
    required this.cardNumber,
    required this.withdrawAmount,
    required this.withdrawTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Withdraw.fromJson(Map<String, dynamic> json) {
    return Withdraw(
      withdrawId: json['withdraw_id'],
      cardNumber: json['card_number'],
      withdrawAmount: (json['withdraw_amount'] as num).toDouble(),
      withdrawTime: DateTime.parse(json['withdraw_time']),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'withdraw_id': withdrawId,
      'card_number': cardNumber,
      'withdraw_amount': withdrawAmount,
      'withdraw_time': withdrawTime.toIso8601String(),
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
