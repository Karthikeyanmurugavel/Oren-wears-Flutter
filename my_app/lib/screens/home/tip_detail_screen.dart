import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../shop/cart_screen.dart';

class TipDetailScreen extends StatelessWidget {
  const TipDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('The Minimalist Look', 
                style: AppTheme.lightTheme.textTheme.displaySmall?.copyWith(color: AppTheme.white)
              ),
              background: Container(
                color: AppTheme.midnightBlue,
                child: const Center(
                  child: Icon(Icons.checkroom, size: 80, color: AppTheme.antiqueGold),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Why this works', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 12),
                  const Text(
                    'This combination focuses on clean lines and neutral tones. By pairing the oversized tee with tailored trousers, you achieve a silhouette that is both relaxed and sophisticated.',
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),
                  const SizedBox(height: 30),
                  Text('Shop the Look', style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 16),
                  _buildProductItem(context, 'Oversized Premium Tee', '\$45.00'),
                  _buildProductItem(context, 'Tailored Pleated Trousers', '\$120.00'),
                  _buildProductItem(context, 'Leather Loafers', '\$180.00'),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -5))],
        ),
        child: ElevatedButton(
          onPressed: () {
            // Add all to cart logic mock
             ScaffoldMessenger.of(context).showSnackBar(
               const SnackBar(content: Text('Added distinct look to cart'))
             );
             Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.midnightBlue,
            foregroundColor: AppTheme.antiqueGold,
          ),
          child: const Text('ADD FULL LOOK TO CART (\$345.00)'),
        ),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, String name, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.softCream,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            color: Colors.grey[300],
            child: const Icon(Icons.image, color: Colors.grey),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(price, style: const TextStyle(color: AppTheme.deepEmerald)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
