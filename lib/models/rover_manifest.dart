import 'sol_info.dart';

class RoverManifest {
  final String name;
  final String landingDate;
  final String launchDate;
  final String status;
  final int maxSol;
  final String maxDate;
  final int totalPhotos;
  final List<SolInfo> sols;

  RoverManifest({
    required this.name,
    required this.landingDate,
    required this.launchDate,
    required this.status,
    required this.maxSol,
    required this.maxDate,
    required this.totalPhotos,
    required this.sols,
  });

  factory RoverManifest.fromJson(Map<String, dynamic> json) {
    final manifest = json['photo_manifest'];
    final List<SolInfo> sols = (manifest['photos'] as List)
        .map((e) => SolInfo.fromJson(e))
        .toList();

    return RoverManifest(
      name: manifest['name'],
      landingDate: manifest['landing_date'],
      launchDate: manifest['launch_date'],
      status: manifest['status'],
      maxSol: manifest['max_sol'],
      maxDate: manifest['max_date'],
      totalPhotos: manifest['total_photos'],
      sols: sols,
    );
  }
}
