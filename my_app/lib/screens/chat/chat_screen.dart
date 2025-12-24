import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../services/ai_service.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = []; // {role: user/ai, text: ...}
  bool _isTyping = false;

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({'role': 'user', 'text': text});
      _isTyping = true;
      _controller.clear();
    });

    final response = await AiService().sendMessage(text);

    if (mounted) {
      setState(() {
        _messages.add({'role': 'ai', 'text': response});
        _isTyping = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Stylist'),
        backgroundColor: AppTheme.softCream,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length + (_isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _messages.length) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('AI is typing...', style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey)),
                    ),
                  ).animate().fadeIn();
                }

                final msg = _messages[index];
                final isUser = msg['role'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? AppTheme.midnightBlue : Colors.white,
                      borderRadius: BorderRadius.circular(16).copyWith(
                        bottomRight: isUser ? Radius.zero : const Radius.circular(16),
                        bottomLeft: isUser ? const Radius.circular(16) : Radius.zero,
                      ),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
                    ),
                    child: Text(
                      msg['text']!,
                      style: TextStyle(color: isUser ? AppTheme.pureWhite : AppTheme.charcoal),
                    ),
                  ),
                ).animate().slideY(begin: 0.1, duration: 300.ms).fadeIn();
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Ask for fashion advice...',
                      filled: true,
                      fillColor: AppTheme.softCream,
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  mini: true,
                  onPressed: _sendMessage,
                  backgroundColor: AppTheme.antiqueGold,
                  child: const Icon(Icons.send, color: AppTheme.midnightBlue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
