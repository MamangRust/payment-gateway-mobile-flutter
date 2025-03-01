class CreateWithdraw {
  final String cardNumber;
  final double withdrawAmount;
  final DateTime withdrawTime;

  CreateWithdraw({
    required this.cardNumber,
    required this.withdrawAmount,
    required this.withdrawTime,
  });

  factory CreateWithdraw.fromJson(Map<String, dynamic> json) {
    return CreateWithdraw(
      cardNumber: json['card_number'],
      withdrawAmount: json['withdraw_amount'].toDouble(),
      withdrawTime: DateTime.parse(json['withdraw_time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'card_number': cardNumber,
      'withdraw_amount': withdrawAmount,
      'withdraw_time': withdrawTime.toIso8601String(),
    };
  }
}
