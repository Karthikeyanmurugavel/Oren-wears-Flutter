import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/app_theme.dart';
import '../../services/ai_service.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _apiKeyController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _checkStoredKey();
  }

  Future<void> _checkStoredKey() async {
    await AiService().loadApiKey();
    if (AiService().isInitialized && mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  Future<void> _login() async {
    final key = _apiKeyController.text.trim();
    if (key.isEmpty) return;

    setState(() => _isLoading = true);
    
    // Initialize AI
    await AiService().initialize(key);
    
    setState(() => _isLoading = false);

    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.midnightBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'OREN WEARS',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppTheme.antiqueGold,
                  letterSpacing: 2.0,
                ),
              ).animate().fadeIn(duration: 800.ms).moveY(begin: 20, end: 0),
              
              const SizedBox(height: 10),
              
              Text(
                'Elevate Your Aesthetic',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.softCream.withOpacity(0.7),
                  fontStyle: FontStyle.italic,
                ),
              ).animate().fadeIn(delay: 300.ms),

              const SizedBox(height: 50),

              TextField(
                controller: _apiKeyController,
                style: const TextStyle(color: AppTheme.charcoal),
                decoration: InputDecoration(
                  hintText: 'Enter Gemini API Key',
                  hintStyle: TextStyle(color: AppTheme.charcoal.withOpacity(0.5)),
                  prefixIcon: const Icon(Icons.key, color: AppTheme.deepEmerald),
                ),
              ).animate().fadeIn(delay: 500.ms).moveX(begin: -20, end: 0),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.antiqueGold,
                    foregroundColor: AppTheme.midnightBlue,
                  ),
                  child: _isLoading 
                    ? const CircularProgressIndicator(color: AppTheme.midnightBlue)
                    : const Text('ENTER EXPERIENCE'),
                ),
              ).animate().fadeIn(delay: 700.ms).moveY(begin: 20, end: 0),
              
              const SizedBox(height: 20),
               TextButton(
                  onPressed: () {
                    // Demo mode skip
                     Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                  },
                  child: Text(
                    "Skip for Demo", 
                    style: TextStyle(color: Colors.white.withOpacity(0.5))
                  )
               )
            ],
          ),
        ),
      ),
    );
  }
}
