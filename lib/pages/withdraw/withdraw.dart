import 'package:flutter/material.dart';
import 'package:mobile/pages/withdraw/withdrawdetail.dart';

class WithdrawHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> withdrawHistory = [
    {
      "id": "WD12345",
      "bank": "BCA",
      "account": "1234567890",
      "amount": 500000,
      "date": "2025-02-26",
      "status": "Success",
    },
    {
      "id": "WD67890",
      "bank": "Mandiri",
      "account": "9876543210",
      "amount": 1000000,
      "date": "2025-02-25",
      "status": "Pending",
    },
    {
      "id": "WD54321",
      "bank": "BNI",
      "account": "5432167890",
      "amount": 200000,
      "date": "2025-02-24",
      "status": "Failed",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Withdraw History',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: const Color(0xFFF5F9FF),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: withdrawHistory.length,
          itemBuilder: (context, index) {
            final transaction = withdrawHistory[index];
            Color statusColor = transaction['status'] == "Success"
                ? Colors.green
                : transaction['status'] == "Pending"
                    ? Colors.orange
                    : Colors.red;

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.white,
              elevation: 4,
              shadowColor: Colors.grey.withOpacity(0.2),
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.account_balance_wallet,
                      color: Colors.blue, size: 28),
                ),
                title: Text(
                  "Rp ${transaction['amount'].toString()}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${transaction['bank']} - ${transaction['date']}",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        transaction['status'],
                        style: TextStyle(
                            color: statusColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 6),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WithdrawDetailScreen(transaction),
                          ),
                        );
                      },
                      child: Text(
                        "View Details",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
