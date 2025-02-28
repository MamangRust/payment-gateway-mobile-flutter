class Transfer {
  final int id;
  final String transferFrom;
  final String transferTo;
  final double transferAmount;
  final String transferTime;
  final String createdAt;
  final String updatedAt;

  Transfer({
    required this.id,
    required this.transferFrom,
    required this.transferTo,
    required this.transferAmount,
    required this.transferTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Transfer.fromJson(Map<String, dynamic> json) {
    return Transfer(
      id: json['id'],
      transferFrom: json['transfer_from'],
      transferTo: json['transfer_to'],
      transferAmount: (json['transfer_amount'] as num).toDouble(),
      transferTime: json['transfer_time'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transfer_from': transferFrom,
      'transfer_to': transferTo,
      'transfer_amount': transferAmount,
      'transfer_time': transferTime,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
