import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      appBar: AppBar(title: const Text('Analytics')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSummaryCard("Monthly Income", 15000000, Colors.green,
                      Icons.trending_up, "12% from last month"),
                  const SizedBox(width: 8),
                  _buildSummaryCard("Monthly Expenses", 8500000, Colors.red,
                      Icons.trending_down, "8% from last month"),
                  const SizedBox(width: 8),
                  _buildSummaryCard("Net Savings", 6500000, Colors.blue,
                      Icons.attach_money, "15% from last month"),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildTransactionAnalysis(),
            const SizedBox(height: 16),
            _buildMonthlyTrend(),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(
      String title, double amount, Color color, IconData icon, String change) {
    return Container(
      width: 220,
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: const TextStyle(color: Colors.grey, fontSize: 14)),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(icon, color: color, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(formatCurrency(amount),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.trending_up, color: color, size: 16),
                  const SizedBox(width: 4),
                  Text(change, style: TextStyle(color: color, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionAnalysis() {
    final transactions = [
      {
        "category": "Transfers",
        "amount": 5000000.0,
        "percentage": 45,
        "color": Colors.blue,
        "icon": Icons.arrow_upward
      },
      {
        "category": "Top Ups",
        "amount": 3500000.0,
        "percentage": 30,
        "color": Colors.green,
        "icon": Icons.add
      },
      {
        "category": "Withdrawals",
        "amount": 2500000.0,
        "percentage": 25,
        "color": Colors.orange,
        "icon": Icons.arrow_downward
      },
    ];

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Transaction Analysis",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              children: transactions.map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: (item["color"] as Color).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)),
                        child: Icon(item["icon"] as IconData,
                            color: item["color"] as Color, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item["category"].toString(),
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                            const SizedBox(height: 4),
                            Text(formatCurrency(item["amount"] as double),
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                            const SizedBox(height: 6),
                            LinearProgressIndicator(
                              value: (item["percentage"] as int) / 100,
                              color: item["color"] as Color,
                              backgroundColor: Colors.grey[300],
                              minHeight: 6,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text("${item["percentage"]}%",
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthlyTrend() {
    final months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];
    final heights = [0.4, 0.5, 0.6, 0.7, 0.8, 0.9];

    return Card(
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Monthly Trend",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(months.length, (index) {
                return Column(
                  children: [
                    Container(
                      width: 30,
                      height: 120 * heights[index],
                      decoration: BoxDecoration(
                        color: Colors.blue[300],
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(months[index],
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
