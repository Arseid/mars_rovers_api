import 'package:flutter/material.dart';
import '../models/rover_photo.dart';
import '../services/nasa_api_service.dart';
import '../theme/app_colors.dart';
import '../widgets/pagination_button.dart';
import '../widgets/photo_list.dart';
import '../widgets/waiting_page.dart';

class RoverPhotosScreen extends StatefulWidget {
  final String roverName;
  final int sol;
  final int totalPhotos;

  const RoverPhotosScreen({
    super.key,
    required this.roverName,
    required this.sol,
    required this.totalPhotos,
  });

  @override
  State<RoverPhotosScreen> createState() => _RoverPhotosScreenState();
}

class _RoverPhotosScreenState extends State<RoverPhotosScreen> {
  int currentPage = 0;
  bool isLoading = true;
  List<RoverPhoto> photos = [];

  int get totalPages => (widget.totalPhotos / 25).ceil();

  @override
  void initState() {
    super.initState();
    _fetchPhotos();
  }

  Future<void> _fetchPhotos() async {
    setState(() => isLoading = true);

    try {
      final fetched = await NasaApiService().fetchPhotosBySol(
        widget.roverName.toLowerCase(),
        widget.sol,
        currentPage + 1,
      );
      setState(() {
        photos = fetched;
        isLoading = false;
      });
    } catch (e) {
      debugPrint('Failed to fetch photos: $e');
      setState(() => isLoading = false);
    }
  }

  void _goToNextPage() {
    if (currentPage < totalPages - 1) {
      setState(() => currentPage++);
      _fetchPhotos();
    }
  }

  void _goToPreviousPage() {
    if (currentPage > 0) {
      setState(() => currentPage--);
      _fetchPhotos();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(
              '${widget.roverName} sol ${widget.sol} photos',
              style: const TextStyle(color: AppColors.primaryText)
          ),
          backgroundColor: AppColors.appBarColor,
          centerTitle: true,
        ),
        body: isLoading
            ? const WaitingPage()
            : Column(
                children: [
                  const SizedBox(height: 12),
                  Text(
                    'Page ${currentPage + 1} / $totalPages',
                    style: const TextStyle(fontSize: 18, color: AppColors.primaryText),
                  ),
                  const SizedBox(height: 10),
                  Expanded(child: PhotoList(photos: photos)),
                  const SizedBox(height: 10),
                  PaginationButtons(
                    hasPrevious: currentPage > 0,
                    hasNext: currentPage < totalPages - 1,
                    onPrevious: _goToPreviousPage,
                    onNext: _goToNextPage,
                  ),
                  const SizedBox(height: 16),
                ],
              ));
  }
}
