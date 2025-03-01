class CreateTransfer {
  final String transferFrom;
  final String transferTo;
  final double transferAmount;

  CreateTransfer({
    required this.transferFrom,
    required this.transferTo,
    required this.transferAmount,
  });

  factory CreateTransfer.fromJson(Map<String, dynamic> json) {
    return CreateTransfer(
      transferFrom: json['transfer_from'],
      transferTo: json['transfer_to'],
      transferAmount: json['transfer_amount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transfer_from': transferFrom,
      'transfer_to': transferTo,
      'transfer_amount': transferAmount,
    };
  }
}
