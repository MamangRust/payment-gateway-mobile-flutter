class Transaction {
  final int id;
  final String cardNumber;
  final double amount;
  final int merchantId;
  final String paymentMethod;
  final String transactionTime;
  final String createdAt;
  final String updatedAt;

  Transaction({
    required this.id,
    required this.cardNumber,
    required this.amount,
    required this.merchantId,
    required this.paymentMethod,
    required this.transactionTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      cardNumber: json['card_number'],
      amount: (json['amount'] as num).toDouble(),
      merchantId: json['merchant_id'],
      paymentMethod: json['payment_method'],
      transactionTime: json['transaction_time'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'card_number': cardNumber,
      'amount': amount,
      'merchant_id': merchantId,
      'payment_method': paymentMethod,
      'transaction_time': transactionTime,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
