import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AiService {
  static final AiService _instance = AiService._internal();
  factory AiService() => _instance;
  AiService._internal();

  GenerativeModel? _model;
  ChatSession? _chat;
  String? _apiKey;

  bool get isInitialized => _model != null;

  Future<void> initialize(String apiKey) async {
    _apiKey = apiKey;
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
    );
    _chat = _model!.startChat();
    
    // Persist key
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('gemini_api_key', apiKey);
  }

  Future<void> loadApiKey() async {
    final prefs = await SharedPreferences.getInstance();
    final key = prefs.getString('gemini_api_key');
    if (key != null && key.isNotEmpty) {
      await initialize(key);
    }
  }

  Future<String?> getTip(String userContext) async {
    if (_model == null) return null;
    
    final prompt = 'Based on the following user context: "$userContext", provide a short, 1-sentence fashion tip that is aesthetic and helpful. Do not use sizing or specific product names yet, just a general style advice.';
    try {
      final response = await _model!.generateContent([Content.text(prompt)]);
      return response.text;
    } catch (e) {
      return "Unable to generate tip right now.";
    }
  }

  Future<String> sendMessage(String message) async {
    if (_chat == null) return "AI is not active. Please check your API key.";
    try {
      final response = await _chat!.sendMessage(Content.text(message));
      return response.text ?? "No response.";
    } catch (e) {
      return "Error: $e";
    }
  }
}
