import 'package:flutter/material.dart';
import '../models/rover_photo.dart';
import 'photo_item.dart';

class PhotoList extends StatelessWidget {
  final List<RoverPhoto> photos;

  const PhotoList({super.key, required this.photos});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      itemCount: photos.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, index) {
        final photo = photos[index];
        return PhotoItem(
          imageUrl: photo.imgSrc,
          cameraName: photo.camera.name,
        );
      },
    );
  }
}
