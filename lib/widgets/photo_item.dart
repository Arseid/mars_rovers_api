import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final String imageUrl;
  final String cameraName;

  const PhotoItem({
    super.key,
    required this.imageUrl,
    required this.cameraName,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(imageUrl),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              cameraName,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
