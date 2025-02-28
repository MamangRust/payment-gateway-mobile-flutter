class Topup {
  final int id;
  final String cardNumber;
  final String topupNo;
  final String topupMethod;
  final String topupAmount;
  final String topupTime;
  final String createdAt;
  final String updatedAt;

  Topup({
    required this.id,
    required this.cardNumber,
    required this.topupNo,
    required this.topupMethod,
    required this.topupAmount,
    required this.topupTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Topup.fromJson(Map<String, dynamic> json) {
    return Topup(
      id: json['id'],
      cardNumber: json['card_number'],
      topupNo: json['topup_no'],
      topupMethod: json['topup_method'],
      topupAmount: json['topup_amount'],
      topupTime: json['topup_time'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'card_number': cardNumber,
      'topup_no': topupNo,
      'topup_method': topupMethod,
      'topup_amount': topupAmount,
      'topup_time': topupTime,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
