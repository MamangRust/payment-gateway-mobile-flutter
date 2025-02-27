import 'package:flutter/material.dart';

class TopUpScreen extends StatefulWidget {
  @override
  _TopUpScreenState createState() => _TopUpScreenState();
}

class _TopUpScreenState extends State<TopUpScreen> {
  String method = 'bank';
  TextEditingController amountController = TextEditingController();

  void setAmount(int value) {
    setState(() {
      amountController.text = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Top Up')),
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
                  child: Icon(Icons.add, color: Colors.blue, size: 28),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Top Up',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Add money to your wallet',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            Text('Payment Method',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            Row(
              children: [
                _buildMethodButton('Bank Transfer', 'bank', '0% fee'),
                SizedBox(width: 8),
                _buildMethodButton('Credit Card', 'card', '2.5% fee'),
              ],
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
            Text('Quick Amount',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [100000, 200000, 500000, 1000000, 2000000, 5000000]
                  .map((value) {
                return _buildQuickAmountButton(value);
              }).toList(),
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
              child: Text('Continue to Payment',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMethodButton(String text, String value, String fee) {
    bool isSelected = method == value;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            method = value;
          });
        },
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey.shade300),
            color: isSelected ? Colors.blue.shade50 : Colors.white,
          ),
          child: Column(
            children: [
              Text(text, style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 4),
              Text(fee, style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAmountButton(int value) {
    return GestureDetector(
      onTap: () => setAmount(value),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text('Rp ${value.toString()}', style: TextStyle(fontSize: 14)),
      ),
    );
  }
}
