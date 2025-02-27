import 'package:flutter/material.dart';
import 'package:mobile/pages/transfer/transfer_create.dart';
import 'package:mobile/pages/transfer/transferdetail.dart';

class TransferHistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactions = [
    {
      'recipient': 'John Doe',
      'amount': 150000,
      'date': '2025-02-26',
      'status': 'Success',
    },
    {
      'recipient': 'Jane Smith',
      'amount': 200000,
      'date': '2025-02-25',
      'status': 'Pending',
    },
    {
      'recipient': 'Alice Brown',
      'amount': 500000,
      'date': '2025-02-24',
      'status': 'Failed',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer History',
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
                MaterialPageRoute(builder: (context) => TransferScreen()),
              );
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F9FF),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            final transaction = transactions[index];
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
                  child: Icon(Icons.send, color: Colors.blue, size: 28),
                ),
                title: Text(
                  "Rp ${transaction['amount'].toString()}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${transaction['recipient']} - ${transaction['date']}",
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
                                TransferDetailScreen(transaction: transaction),
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
