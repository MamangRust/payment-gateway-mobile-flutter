import 'package:mobile/domain/requests/card/create.dart';

class UpdateCard extends CreateCard {
  final int cardId;

  UpdateCard({
    required this.cardId,
    required int userId,
    required String cardType,
    required DateTime expireDate,
    required String cvv,
    required String cardProvider,
  }) : super(
          userId: userId,
          cardType: cardType,
          expireDate: expireDate,
          cvv: cvv,
          cardProvider: cardProvider,
        );

  factory UpdateCard.fromJson(Map<String, dynamic> json) {
    return UpdateCard(
      cardId: json['card_id'],
      userId: json['user_id'],
      cardType: json['card_type'],
      expireDate: DateTime.parse(json['expire_date']),
      cvv: json['cvv'],
      cardProvider: json['card_provider'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final data = super.toJson();
    data['card_id'] = cardId;
    return data;
  }
}
