import 'package:flutter/material.dart';
import '../components/color.dart';
import 'package:spotify/components/Genre.dart';

class ArtistCard extends StatelessWidget {
  final String artistName;
  final String imageUrl;
  final List<String> genres;
  final VoidCallback onTap;

  ArtistCard({
    required this.artistName,
    required this.imageUrl,
    required this.genres,
    required this.onTap,
  });

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(
            top: 10.0, left: 20.0, right: 20.0, bottom: 2.0),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(
            top: 20.0, left: 10.0, right: 10.0, bottom: 20.0),
        child: Row(
          children: [
            const SizedBox(width: 10),
            CircleAvatar(
              backgroundImage: AssetImage(
                  imageUrl), // Utilisation de AssetImage pour charger l'image depuis assets
              radius: 30, // Rayon du cercle
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artistName,
                    style:
                        const TextStyle(color: AppColors.white, fontSize: 18),
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    spacing: 5.0,
                    runSpacing: 5.0,
                    children: genres.map((genre) => const Genre()).toList(),
                  )
                ],
              ),
            ),
            const Icon(Icons.arrow_forward, color: AppColors.white),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
