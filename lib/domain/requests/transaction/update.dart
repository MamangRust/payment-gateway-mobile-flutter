class UpdateTransaction {
  final int id;
  final String cardNumber;
  final double amount;
  final String paymentMethod;
  final int merchantId;
  final String apiKey;
  final DateTime transactionTime;

  UpdateTransaction({
    required this.id,
    required this.cardNumber,
    required this.amount,
    required this.paymentMethod,
    required this.merchantId,
    required this.apiKey,
    required this.transactionTime,
  });

  factory UpdateTransaction.fromJson(Map<String, dynamic> json) {
    return UpdateTransaction(
      id: json['id'],
      cardNumber: json['card_number'],
      amount: json['amount'].toDouble(),
      paymentMethod: json['payment_method'],
      merchantId: json['merchant_id'],
      apiKey: json['api_key'],
      transactionTime: DateTime.parse(json['transaction_time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'card_number': cardNumber,
      'amount': amount,
      'payment_method': paymentMethod,
      'merchant_id': merchantId,
      'api_key': apiKey,
      'transaction_time': transactionTime.toIso8601String(),
    };
  }
}
