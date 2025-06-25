import 'package:flutter/material.dart';
import 'package:mars_rover_api/theme/app_colors.dart';
import '../widgets/drawer_menu.dart';
import '../services/nasa_api_service.dart';
import '../models/rover_manifest.dart';
import '../widgets/waiting_page.dart';
import '../widgets/rover_data_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedRover = 'Curiosity';

  bool isLoading = true;
  RoverManifest? manifest;

  final _apiService = NasaApiService();

  @override
  void initState() {
    super.initState();
    _fetchRoverManifest();
  }

  Future<void> _fetchRoverManifest([String? rover]) async {
    setState(() => isLoading = true);

    try {
      final data = await _apiService.fetchManifest((rover ?? selectedRover).toLowerCase());
      setState(() {
        manifest = data;
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Failed to fetch rover data: $e');
      setState(() => isLoading = false);
    }
  }

  void _selectRover(String rover) {
    if (rover == selectedRover) return;
    setState(() => selectedRover = rover);
    _fetchRoverManifest(rover);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Mars Rover Photos', style: TextStyle(color: AppColors.primaryText)),
        centerTitle: true,
        backgroundColor: AppColors.appBarColor,
      ),
      drawer: DrawerMenu(
        onRoverSelected: _selectRover,
      ),
      body: isLoading || manifest == null
          ? const WaitingPage()
          : RoverDataSection(
              roverName: selectedRover,
              manifest: manifest!,
            ),
    );
  }
}
