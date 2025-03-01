class UpdateTopup {
  final int id;
  final String cardNumber;
  final double topupAmount;
  final String topupMethod;
  final dynamic toast;

  UpdateTopup({
    required this.id,
    required this.cardNumber,
    required this.topupAmount,
    required this.topupMethod,
    required this.toast,
  });

  factory UpdateTopup.fromJson(Map<String, dynamic> json) {
    return UpdateTopup(
      id: json['id'],
      cardNumber: json['card_number'],
      topupAmount: json['topup_amount'].toDouble(),
      topupMethod: json['topup_method'],
      toast: json['toast'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'card_number': cardNumber,
      'topup_amount': topupAmount,
      'topup_method': topupMethod,
      'toast': toast,
    };
  }
}
