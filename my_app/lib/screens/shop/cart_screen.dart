import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'payment_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Bag'),
        backgroundColor: AppTheme.softCream,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_bag_outlined, size: 60, color: Colors.grey),
            const SizedBox(height: 20),
            Text(
              'Your bag is empty.',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Continue Shopping'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Total', style: TextStyle(color: Colors.grey)),
                Text('\$0.00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PaymentScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.midnightBlue,
                foregroundColor: AppTheme.antiqueGold,
              ),
              child: const Text('CHECKOUT'),
            ),
          ],
        ),
      ),
    );
  }
}
