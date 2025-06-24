import 'package:flutter/material.dart';
import '../widgets/drawer_menu.dart';
import '../widgets/rover_info_card.dart';
import '../widgets/sol_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedRover = 'Curiosity';

  final roverInfo = {
    "launch_date": "26-11-2011",
    "landing_date": "06-08-2012",
    "status": "active",
    "max_sol": 4102,
    "max_date": "19-02-2024",
    "total_photos": 695670,
  };

  final sols = [
    {"sol": 0, "date": "06-08-2012", "photos": 3702},
    {"sol": 1, "date": "07-08-2012", "photos": 16},
    {"sol": 2, "date": "08-08-2012", "photos": 74},
    {"sol": 3, "date": "09-08-2012", "photos": 338},
    {"sol": 10, "date": "16-08-2012", "photos": 26},
    {"sol": 12, "date": "18-08-2012", "photos": 32},
    {"sol": 13, "date": "19-08-2012", "photos": 208},
    {"sol": 14, "date": "20-08-2012", "photos": 70},
  ];

  void _selectRover(String rover) {
    if (rover == selectedRover) return;
    setState(() {
      selectedRover = rover;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Mars Rover Photos'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[200],
      ),
      drawer: DrawerMenu(
        onRoverSelected: _selectRover,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            RoverInfoCard(roverName: selectedRover, info: roverInfo),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: sols.length,
                itemBuilder: (context, index) {
                  final solMap = sols[index];
                  return SolListItem(
                    solNumber: solMap['sol'] as int,
                    date: solMap['date'] as String,
                    photoCount: solMap['photos'] as int,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
