class CreateCard {
  final int userId;
  final String cardType;
  final DateTime expireDate;
  final String cvv;
  final String cardProvider;

  CreateCard({
    required this.userId,
    required this.cardType,
    required this.expireDate,
    required this.cvv,
    required this.cardProvider,
  });

  factory CreateCard.fromJson(Map<String, dynamic> json) {
    return CreateCard(
      userId: json['user_id'],
      cardType: json['card_type'],
      expireDate: DateTime.parse(json['expire_date']),
      cvv: json['cvv'],
      cardProvider: json['card_provider'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'card_type': cardType,
      'expire_date': expireDate.toIso8601String(),
      'cvv': cvv,
      'card_provider': cardProvider,
    };
  }
}
