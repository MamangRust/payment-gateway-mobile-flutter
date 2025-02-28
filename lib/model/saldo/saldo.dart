class Saldo {
  final int id;
  final String cardNumber;
  final double totalBalance;
  final String withdrawTime;
  final double withdrawAmount;
  final String createdAt;
  final String updatedAt;

  Saldo({
    required this.id,
    required this.cardNumber,
    required this.totalBalance,
    required this.withdrawTime,
    required this.withdrawAmount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Saldo.fromJson(Map<String, dynamic> json) {
    return Saldo(
      id: json['id'],
      cardNumber: json['card_number'],
      totalBalance: (json['total_balance'] as num).toDouble(),
      withdrawTime: json['withdraw_time'],
      withdrawAmount: (json['withdraw_amount'] as num).toDouble(),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'card_number': cardNumber,
      'total_balance': totalBalance,
      'withdraw_time': withdrawTime,
      'withdraw_amount': withdrawAmount,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
