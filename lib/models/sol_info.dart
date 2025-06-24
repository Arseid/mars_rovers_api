class SolInfo {
  final int sol;
  final String earthDate;
  final int totalPhotos;
  final List<String> cameras;

  SolInfo({
    required this.sol,
    required this.earthDate,
    required this.totalPhotos,
    required this.cameras,
  });

  factory SolInfo.fromJson(Map<String, dynamic> json) {
    return SolInfo(
      sol: json['sol'],
      earthDate: json['earth_date'],
      totalPhotos: json['total_photos'],
      cameras: List<String>.from(json['cameras']),
    );
  }
}
