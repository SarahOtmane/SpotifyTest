import 'package:flutter/material.dart';
import 'package:spotify/components/artistCard.dart';
import 'package:spotify/components/artistImageCard.dart';
import '../components/color.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        title: const Text('Artistes Likés'),
        backgroundColor: AppColors.black,
        titleTextStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ArtistImageCard(
                  artistName: "Taylor Swift",
                  imagePath: "assets/images/taylorSwift.jpg",
                  onTap: () {
                    // Gérer la sélection de l'artiste
                  },
                ),
                ArtistImageCard(
                  artistName: "Ed Sheeran",
                  imagePath: "assets/images/taylorSwift.jpg",
                  onTap: () {
                    // Gérer la sélection de l'artiste
                  },
                ),
                ArtistImageCard(
                  artistName: "Ariana Grande",
                  imagePath: "assets/images/taylorSwift.jpg",
                  onTap: () {
                    // Gérer la sélection de l'artiste
                  },
                ),
                ArtistImageCard(
                  artistName: "Drake",
                  imagePath: "assets/images/taylorSwift.jpg",
                  onTap: () {
                    // Gérer la sélection de l'artiste
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 45),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Leurs futurs concerts",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            // Utilisation d'Expanded pour que cette partie occupe tout l'espace restant
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ArtistCard(
                    artistName: "Taylor Swift",
                    imageUrl: "assets/images/taylorSwift.jpg",
                    genres: const ["Pop", "Country"],
                    onTap: () {
                      // Gérer la sélection de l'artiste
                    },
                  ),
                  ArtistCard(
                    artistName: "Ed Sheeran",
                    imageUrl: "assets/images/taylorSwift.jpg",
                    genres: const ["Pop", "Folk"],
                    onTap: () {
                      // Gérer la sélection de l'artiste
                    },
                  ),
                  ArtistCard(
                    artistName: "Ariana Grande",
                    imageUrl: "assets/images/taylorSwift.jpg",
                    genres: const ["Pop", "R&B"],
                    onTap: () {
                      // Gérer la sélection de l'artiste
                    },
                  ),
                  ArtistCard(
                    artistName: "Drake",
                    imageUrl: "assets/images/taylorSwift.jpg",
                    genres: const ["Hip Hop", "Rap"],
                    onTap: () {
                      // Gérer la sélection de l'artiste
                    },
                  ),
                  ArtistCard(
                    artistName: "Beyoncé",
                    imageUrl: "assets/images/taylorSwift.jpg",
                    genres: const ["R&B", "Pop"],
                    onTap: () {
                      // Gérer la sélection de l'artiste
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
