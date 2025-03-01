class CardYearlyTransferAmount {
  final String year;
  final double totalAmount;

  CardYearlyTransferAmount({required this.year, required this.totalAmount});

  factory CardYearlyTransferAmount.fromJson(Map<String, dynamic> json) {
    return CardYearlyTransferAmount(
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
