import 'package:flutter/material.dart';

class SolListItem extends StatelessWidget {
  final int solNumber;
  final String date;
  final int photoCount;

  const SolListItem({
    super.key,
    required this.solNumber,
    required this.date,
    required this.photoCount,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: RichText(
        text: TextSpan(
          text: 'Sol $solNumber',
          style: const TextStyle(
            color: Color(0xFF607D8B),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          children: [
            TextSpan(
              text: ' on $date',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      trailing: Text(
        '$photoCount',
        style: const TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
