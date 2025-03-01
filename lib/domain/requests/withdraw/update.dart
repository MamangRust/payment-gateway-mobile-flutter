class UpdateWithdraw {
  final int id;
  final String cardNumber;
  final double withdrawAmount;
  final DateTime withdrawTime;

  UpdateWithdraw({
    required this.id,
    required this.cardNumber,
    required this.withdrawAmount,
    required this.withdrawTime,
  });

  factory UpdateWithdraw.fromJson(Map<String, dynamic> json) {
    return UpdateWithdraw(
      id: json['id'],
      cardNumber: json['card_number'],
      withdrawAmount: json['withdraw_amount'].toDouble(),
      withdrawTime: DateTime.parse(json['withdraw_time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'card_number': cardNumber,
      'withdraw_amount': withdrawAmount,
      'withdraw_time': withdrawTime.toIso8601String(),
    };
  }
