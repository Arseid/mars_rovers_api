import 'package:flutter/material.dart';
import '../models/rover_manifest.dart';
import 'rover_info_card.dart';
import 'sol_list_view.dart';

class RoverDataSection extends StatelessWidget {
  final String roverName;
  final RoverManifest manifest;

  const RoverDataSection({
    super.key,
    required this.roverName,
    required this.manifest,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: RoverInfoCard(
            roverName: roverName,
            info: manifest.toMap(),
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: SolListView(
            sols: manifest.sols
                .map((sol) => {
              "sol": sol.sol,
              "date": sol.earthDate,
              "photos": sol.totalPhotos,
            })
                .toList(),
            roverName: roverName,
          ),
        ),
      ],
    );
  }
}
