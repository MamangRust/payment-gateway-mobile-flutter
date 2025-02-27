import 'package:flutter/material.dart';

class TransferDetailScreen extends StatelessWidget {
  final Map<String, dynamic> transaction;

  TransferDetailScreen({required this.transaction});

  @override
  Widget build(BuildContext context) {
    Color statusColor = transaction['status'] == "Success"
        ? Colors.green
        : transaction['status'] == "Pending"
            ? Colors.orange
            : Colors.red;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transfer Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: const Color(0xFFF5F9FF),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.white,
              elevation: 4,
              shadowColor: Colors.grey.withOpacity(0.2),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transaction ID: ${transaction['id']?.toString() ?? '-'}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    _buildDetailRow(Icons.person, "Recipient",
                        transaction['recipient']?.toString() ?? '-'),
                    _buildDetailRow(Icons.account_balance, "Bank",
                        transaction['bank']?.toString() ?? '-'),
                    _buildDetailRow(Icons.account_circle, "Account Number",
                        transaction['account']?.toString() ?? '-'),
                    _buildDetailRow(Icons.monetization_on, "Amount",
                        "Rp ${transaction['amount']?.toString() ?? '0'}"),
                    _buildDetailRow(Icons.date_range, "Date",
                        transaction['date']?.toString() ?? '-'),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Status",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            transaction['status']?.toString() ?? '-',
                            style: TextStyle(
                                color: statusColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Back",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 24),
          SizedBox(width: 12),
          Expanded(
            child: Text(title,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
          ),
          Text(value,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
