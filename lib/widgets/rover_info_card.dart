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
    const labelStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    const valueStyle = TextStyle(
      fontSize: 16,
    );

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      decoration: BoxDecoration(
        color: const Color(0xFFDECECA),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black38, blurRadius: 10, offset: Offset(0, 4)),
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
                Text("Landing date:", style: labelStyle),
                Text("Launch date:", style: labelStyle),
                Text("Mission status:", style: labelStyle),
                Text("Max sol:", style: labelStyle),
                Text("Max date:", style: labelStyle),
                Text("Total photos:", style: labelStyle),
              ]),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text("${info["landing_date"]}", style: valueStyle),
                Text("${info["launch_date"]}", style: valueStyle),
                Text("${info["status"]}", style: valueStyle),
                Text("${info["max_sol"]}", style: valueStyle),
                Text("${info["max_date"]}", style: valueStyle),
                Text("${info["total_photos"]}", style: valueStyle),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
