import 'package:flutter/material.dart';
import 'sol_list_item.dart';

class SolListView extends StatelessWidget {
  final List<Map<String, dynamic>> sols;

  const SolListView({super.key, required this.sols});

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
          );
      },
      separatorBuilder: (context, index) => const Divider(
        color: Color(0xFF607D8B),
        height: 0.5,
      ),
    );
  }
}
