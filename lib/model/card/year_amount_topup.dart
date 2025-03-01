class CardYearlyTopupAmount {
  final String year;
  final double totalAmount;

  CardYearlyTopupAmount({required this.year, required this.totalAmount});

  factory CardYearlyTopupAmount.fromJson(Map<String, dynamic> json) {
    return CardYearlyTopupAmount(
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
