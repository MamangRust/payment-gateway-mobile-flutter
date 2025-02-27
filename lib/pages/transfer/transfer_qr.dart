import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRTransferScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String accountNumber = "1234567890";

    return Scaffold(
      appBar: AppBar(title: Text("QR Code Transfer")),
      backgroundColor: const Color(0xFFF5F9FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Scan QR untuk Transfer",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            QrImageView(
              data: accountNumber,
              size: 200,
              version: QrVersions.auto,
            ),
            SizedBox(height: 16),
            Text(
              "Nomor Rekening: $accountNumber",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
