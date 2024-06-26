import 'package:flutter/material.dart';
import 'package:spotify/components/color.dart';

class ArtistImageCard extends StatelessWidget {
  final String artistName;
  final String imagePath; // This should be an external URL
  final VoidCallback onTap;

  const ArtistImageCard({
    super.key,
    required this.artistName,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                imagePath,
                height: 175, // Hauteur de la card
                width: 175, // Largeur de la card
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: 175,
                padding: const EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft:
                        Radius.circular(5), // Coin inférieur gauche arrondi
                    bottomRight:
                        Radius.circular(5), // Coin inférieur droit arrondi
                  ),
                  color: AppColors.darkGrey.withOpacity(0.6),
                ),
                child: Center(
                  child: Text(
                    artistName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
