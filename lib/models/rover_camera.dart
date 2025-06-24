class RoverCamera {
  final int id;
  final String name;
  final int roverId;
  final String fullName;

  RoverCamera({
    required this.id,
    required this.name,
    required this.roverId,
    required this.fullName,
  });

  factory RoverCamera.fromJson(Map<String, dynamic> json) {
    return RoverCamera(
      id: json['id'],
      name: json['name'],
      roverId: json['rover_id'],
      fullName: json['full_name'],
    );
  }
}