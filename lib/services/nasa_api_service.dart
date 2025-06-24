import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/rover_manifest.dart';
import '../config/api_config.dart';

class NasaApiService {
  Future<RoverManifest> fetchManifest(String roverName) async {
    final url = Uri.parse('${ApiConfig.baseUrl}/manifests/$roverName?api_key=${ApiConfig.apiKey}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return RoverManifest.fromJson(data);
    } else {
      throw Exception('Failed to load manifest for $roverName');
    }
  }
}
