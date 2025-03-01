import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mobile/pages/analytics.dart';
import 'package:mobile/pages/auth/login.dart';
import 'package:mobile/pages/profilepage.dart';
import 'package:mobile/pages/topup/topup.dart';
import 'package:mobile/pages/transfer/transfer.dart';
import 'package:mobile/pages/withdraw/withdraw.dart';
import 'package:mobile/store/auth.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  final double balance = 1000000;
  String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp').format(amount);
  }

  void _onMenuSelected(BuildContext context, String value, WidgetRef ref) {
    if (value == 'profile') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfileScreen()));
    } else if (value == 'logout') {
      ref.read(authProvider.notifier).logout();

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) => _onMenuSelected(context, value, ref),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(Icons.person, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Profile'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.black),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/46998157?v=4"),
                radius: 20,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF5F9FF),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.blue, Colors.lightBlue]),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Available Balance',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  SizedBox(height: 8),
                  Text(formatCurrency(balance),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TopUpHistoryScreen())),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                        ),
                        child: Text('Top Up'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WithdrawHistoryScreen())),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                        ),
                        child: Text('Withdraw'),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  _buildMenuItem(
                      context, Icons.send, 'Transfer', TransferHistoryScreen()),
                  _buildMenuItem(
                      context, Icons.add, 'Top Up', TopUpHistoryScreen()),
                  _buildMenuItem(context, Icons.money_off, 'Withdraw',
                      WithdrawHistoryScreen()),
                  _buildMenuItem(context, Icons.bar_chart, 'Analytics',
                      const AnalyticsScreen()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, IconData icon, String title, Widget screen) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => screen)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(height: 8),
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
