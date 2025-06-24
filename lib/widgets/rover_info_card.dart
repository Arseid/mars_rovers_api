import 'package:flutter/material.dart';

class RoverInfoCard extends StatelessWidget {
  final String roverName;
  final Map<String, dynamic> info;

  const RoverInfoCard({
    super.key,
    required this.roverName,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      decoration: BoxDecoration(
        color: const Color(0xFFDECECA),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          Text(
            roverName,
            style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("Landing date:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Launch date:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Mission status:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Max sol:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Max date:", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Total photos:", style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text("${info["landing_date"]}"),
                Text("${info["launch_date"]}"),
                Text("${info["status"]}"),
                Text("${info["max_sol"]}"),
                Text("${info["max_date"]}"),
                Text("${info["total_photos"]}"),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
