import 'package:flutter/material.dart';
import 'package:mobile/pages/home.dart';
import 'package:mobile/pages/profilepage.dart';
import 'package:mobile/pages/topup/topup.dart';
import 'package:mobile/pages/transfer/transfer.dart';
import 'package:mobile/pages/withdraw/withdraw.dart';
import 'package:mobile/pages/analytics.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    TransferHistoryScreen(),
    TopUpHistoryScreen(),
    WithdrawHistoryScreen(),
    AnalyticsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }
}
