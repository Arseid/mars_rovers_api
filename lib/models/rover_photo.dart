import 'package:mars_rover_api/models/rover_camera.dart';

class RoverPhoto {
  final int id;
  final int sol;
  final RoverCamera camera;
  final String imgSrc;
  final String earthDate;

  RoverPhoto({
    required this.id,
    required this.sol,
    required this.camera,
    required this.imgSrc,
    required this.earthDate,
  });

  factory RoverPhoto.fromJson(Map<String, dynamic> json) {
    return RoverPhoto(
      id: json['id'],
      sol: json['sol'],
      camera: RoverCamera.fromJson(json['camera']),
      imgSrc: json['img_src'],
      earthDate: json['earth_date'],
    );
  }
}