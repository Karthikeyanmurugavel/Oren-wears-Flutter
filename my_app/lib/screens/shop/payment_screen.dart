import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Payment Method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
             _buildPaymentOption(Icons.credit_card, 'Credit Card', true),
             _buildPaymentOption(Icons.account_balance_wallet, 'GPay', false),
             _buildPaymentOption(Icons.money, 'Cash on Delivery', false),
             
             const Spacer(),
             
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: () {
                   ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text('Order Placed Successfully!'))
                   );
                   Navigator.popUntil(context, (route) => route.isFirst);
                 },
                 style: ElevatedButton.styleFrom(backgroundColor: AppTheme.deepEmerald),
                 child: const Text('PAY NOW'),
               ),
             )
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(IconData icon, String label, bool selected) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: selected ? AppTheme.antiqueGold : Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
        color: selected ? AppTheme.antiqueGold.withOpacity(0.1) : Colors.white,
      ),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.midnightBlue),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
          const Spacer(),
          if (selected) const Icon(Icons.check_circle, color: AppTheme.deepEmerald),
        ],
      ),
    );
  }
}
