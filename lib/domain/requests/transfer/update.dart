class UpdateTransfer {
  final int id;
  final String transferFrom;
  final String transferTo;
  final double transferAmount;

  UpdateTransfer({
    required this.id,
    required this.transferFrom,
    required this.transferTo,
    required this.transferAmount,
  });

  factory UpdateTransfer.fromJson(Map<String, dynamic> json) {
    return UpdateTransfer(
      id: json['id'],
      transferFrom: json['transfer_from'],
      transferTo: json['transfer_to'],
      transferAmount: json['transfer_amount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transfer_from': transferFrom,
      'transfer_to': transferTo,
      'transfer_amount': transferAmount,
    };
  }
}
