import 'package:flutter/material.dart';

class WithdrawScreen extends StatefulWidget {
  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  String? selectedBank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Withdraw Money')),
      backgroundColor: const Color(0xFFF5F9FF),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade100,
                    shape: BoxShape.circle,
                  ),
                  child:
                      Icon(Icons.arrow_downward, color: Colors.blue, size: 28),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Withdraw Money',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Cash out to your bank account',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            Text('Bank Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedBank,
              hint: Text('Select a bank'),
              onChanged: (value) => setState(() => selectedBank = value),
              items: ['BCA', 'Mandiri', 'BNI', 'BRI'].map((bank) {
                return DropdownMenuItem(
                    value: bank.toLowerCase(), child: Text(bank));
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text('Account Number',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            TextField(
              controller: bankAccountController,
              decoration: InputDecoration(
                hintText: 'Enter your account number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text('Amount',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: 'Rp ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Important Notice',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800)),
                  SizedBox(height: 8),
                  Text('• Withdrawals are processed within 24 hours',
                      style: TextStyle(color: Colors.blue.shade700)),
                  Text('• Maximum daily withdrawal: Rp 50,000,000',
                      style: TextStyle(color: Colors.blue.shade700)),
                  Text('• Fee: Rp 6,500 per transaction',
                      style: TextStyle(color: Colors.blue.shade700)),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 14),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Withdraw Now',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
