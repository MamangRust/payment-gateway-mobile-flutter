import 'package:flutter/material.dart';
import 'package:mobile/pages/topup/topup_create.dart';
import 'package:mobile/pages/topup/topupdetail.dart';

class TopUpHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> topUpHistory = [
    {
      "id": "TXN12345",
      "amount": 50000,
      "date": "2025-02-26",
      "status": "Success",
    },
    {
      "id": "TXN67890",
      "amount": 100000,
      "date": "2025-02-25",
      "status": "Pending",
    },
    {
      "id": "TXN54321",
      "amount": 20000,
      "date": "2025-02-24",
      "status": "Failed",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top-Up History',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TopUpScreen()),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F9FF),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: topUpHistory.length,
          itemBuilder: (context, index) {
            final transaction = topUpHistory[index];
            Color statusColor = transaction['status'] == "Success"
                ? Colors.green
                : transaction['status'] == "Pending"
                    ? Colors.orange
                    : Colors.red;

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              color: Colors.white,
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
                  transaction['date'],
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
                                TopupDetailScreen(transaction),
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
