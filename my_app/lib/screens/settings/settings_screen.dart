import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          _buildSectionHeader(context, 'General'),
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Theme'),
            trailing: const Text('Light'),
            onTap: () {
              // Toggle theme logic
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            trailing: Switch(value: true, onChanged: (v) {}),
          ),
          
          _buildSectionHeader(context, 'AI Configuration'),
          ListTile(
            leading: const Icon(Icons.key),
            title: const Text('API Key'),
            subtitle: const Text('Edit your Gemini API key'),
            onTap: () {
              // Open dialog to edit key
            },
          ),
          
          _buildSectionHeader(context, 'Account'),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {},
          ),
           ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: AppTheme.midnightBlue.withOpacity(0.6),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
