class CreateTransaction {
  final String cardNumber;
  final double amount;
  final String paymentMethod;
  final int merchantId;
  final String apiKey;
  final DateTime transactionTime;

  CreateTransaction({
    required this.cardNumber,
    required this.amount,
    required this.paymentMethod,
    required this.merchantId,
    required this.apiKey,
    required this.transactionTime,
  });

  factory CreateTransaction.fromJson(Map<String, dynamic> json) {
    return CreateTransaction(
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
      'card_number': cardNumber,
      'amount': amount,
      'payment_method': paymentMethod,
      'merchant_id': merchantId,
      'api_key': apiKey,
      'transaction_time': transactionTime.toIso8601String(),
    };
  }
}
