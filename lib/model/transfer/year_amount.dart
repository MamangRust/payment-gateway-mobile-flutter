class TransferYearAmount {
  final String year;
  final double totalAmount;

  TransferYearAmount({
    required this.year,
    required this.totalAmount,
  });

  factory TransferYearAmount.fromJson(Map<String, dynamic> json) {
    return TransferYearAmount(
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
