import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../shop/product_list_screen.dart';
import '../shop/cart_screen.dart';
import '../chat/chat_screen.dart';
import '../settings/settings_screen.dart';
import 'tip_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<String> _categories = [
    'Mens',
    'Pants',
    'Shirts',
    'T-Shirts',
    'Shorts',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OREN'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: AppTheme.midnightBlue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: AppTheme.antiqueGold),
              child: Center(
                child: Text(
                  'OREN WEARS',
                  style: TextStyle(
                    color: AppTheme.midnightBlue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: AppTheme.softCream),
              title: const Text('Home', style: TextStyle(color: AppTheme.softCream)),
              onTap: () => Navigator.pop(context),
            ),
            ..._categories.map((c) => ListTile(
              leading: const Icon(Icons.category, color: AppTheme.softCream),
              title: Text(c, style: const TextStyle(color: AppTheme.softCream)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (_) => ProductListScreen(category: c))
                );
              },
            )),
            const Divider(color: Colors.white24),
            ListTile(
              leading: const Icon(Icons.auto_awesome, color: AppTheme.antiqueGold),
              title: const Text('AI Stylist', style: TextStyle(color: AppTheme.softCream)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ChatScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: AppTheme.softCream),
              title: const Text('Settings', style: TextStyle(color: AppTheme.softCream)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // AI Tip Box
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppTheme.midnightBlue, AppTheme.deepEmerald],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.auto_awesome, color: AppTheme.antiqueGold),
                      const SizedBox(width: 10),
                      Text(
                        'Style Insight',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppTheme.antiqueGold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Based on your recent aesthetic...',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Try pairing a vintage oversized tee with tailored trousers for a balanced silhouette.',
                    style: TextStyle(color: Colors.white, fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const TipDetailScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppTheme.midnightBlue,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                    child: const Text('View Full Outfit'),
                  ),
                ],
              ),
            ),
            
            // Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Collections', style: Theme.of(context).textTheme.displayMedium),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                padding: const EdgeInsets.only(left: 16),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 12),
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppTheme.softCream,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        _categories[index],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
          if (index == 1) { // Chat
             Navigator.push(context, MaterialPageRoute(builder: (_) => const ChatScreen()));
          } else if (index == 2) { // Settings (Profile)
             Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
          }
        },
        selectedItemColor: AppTheme.midnightBlue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.auto_awesome), label: 'AI'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
