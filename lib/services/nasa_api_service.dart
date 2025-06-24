import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/rover_manifest.dart';
import '../config/api_config.dart';
import '../models/rover_photo.dart';

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

  Future<List<RoverPhoto>> fetchPhotosBySol(String roverName, int sol, int page) async {
    final url = Uri.parse(
      '${ApiConfig.baseUrl}/rovers/$roverName/photos?sol=$sol&page=$page&api_key=${ApiConfig.apiKey}',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final photosJson = data['photos'] as List;

      return photosJson.map((json) => RoverPhoto.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load photos for $roverName at sol $sol');
    }
  }
}
