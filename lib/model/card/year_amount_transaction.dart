class CardYearlyTransactionAmount {
  final String year;
  final double totalAmount;

  CardYearlyTransactionAmount({required this.year, required this.totalAmount});

  factory CardYearlyTransactionAmount.fromJson(Map<String, dynamic> json) {
    return CardYearlyTransactionAmount(
      year: json['year'],
      totalAmount: (json['total_amount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'year': year,
      'total_amount': totalAmount,
    };
  }
}
