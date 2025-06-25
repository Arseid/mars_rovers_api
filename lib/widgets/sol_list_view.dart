import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'sol_list_item.dart';
import '../views/rover_photos_screen.dart';

class SolListView extends StatelessWidget {
  final List<Map<String, dynamic>> sols;
  final String roverName;

  const SolListView({super.key, required this.sols, required this.roverName});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: sols.length,
      itemBuilder: (context, index) {
        final solMap = sols[index];
        return SolListItem(
          solNumber: solMap['sol'] as int,
          date: solMap['date'] as String,
          photoCount: solMap['photos'] as int,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RoverPhotosScreen(
                  roverName: roverName,
                  sol: solMap['sol'],
                  totalPhotos: solMap['photos'],
                ),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) => const Divider(
        color: AppColors.secondaryText,
        height: 0.5,
      ),
    );
  }
}
