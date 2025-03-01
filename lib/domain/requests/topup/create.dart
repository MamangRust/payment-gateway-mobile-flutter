class CreateTopup {
  final String cardNumber;
  final double topupAmount;
  final String topupMethod;

  CreateTopup({
    required this.cardNumber,
    required this.topupAmount,
    required this.topupMethod,
  });

  factory CreateTopup.fromJson(Map<String, dynamic> json) {
    return CreateTopup(
      cardNumber: json['card_number'],
      topupAmount: json['topup_amount'].toDouble(),
      topupMethod: json['topup_method'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'card_number': cardNumber,
      'topup_amount': topupAmount,
      'topup_method': topupMethod,
    };
  }
}
