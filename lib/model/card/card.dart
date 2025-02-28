class Card {
  final int id;
  final int userId;
  final String cardNumber;
  final String cardType;
  final DateTime expireDate;
  final String cvv;
  final String cardProvider;
  final String createdAt;
  final String updatedAt;

  Card({
    required this.id,
    required this.userId,
    required this.cardNumber,
    required this.cardType,
    required this.expireDate,
    required this.cvv,
    required this.cardProvider,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      id: json['id'],
      userId: json['user_id'],
      cardNumber: json['card_number'],
      cardType: json['card_type'],
      expireDate: DateTime.parse(json['expire_date']),
      cvv: json['cvv'],
      cardProvider: json['card_provider'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'card_number': cardNumber,
      'card_type': cardType,
      'expire_date': expireDate.toIso8601String(),
      'cvv': cvv,
      'card_provider': cardProvider,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
