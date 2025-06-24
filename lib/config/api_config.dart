import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static String get baseUrl => dotenv.env['FLUTTER_API_BASE_URL'] ?? '';
  static String get apiKey => dotenv.env['FLUTTER_API_KEY'] ?? '';
}