import 'package:flutter/material.dart';
import 'package:spotify/components/concertCard.dart';
import 'package:spotify/components/artistImageCard.dart';
import '../components/color.dart';

import '../data/concertData.dart';

class LikeScreen extends StatelessWidget {
  LikeScreen({Key? key});

  final List<Concert> _displayedConcerts = [];
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
          const SizedBox(height: 25),
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
            child: SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap:
                    true, // Ajouté pour rendre la ListView flexible dans le ScrollView
                physics:
                    const NeverScrollableScrollPhysics(), // Pour désactiver le défilement de la ListView
                itemCount: _displayedConcerts.length,
                itemBuilder: (context, index) {
                  final concert = _displayedConcerts[index];
                  return ArtistConcertCard(
                    artistName: concert.nameArtist,
                    date: concert.date,
                    location: concert.city,
                    link: concert.link,
                    genres: concert.genres,
                    showGenres: true,
                    city: concert.city,
                    onTap: () {
                      // Handle artist selection
                    },
                  );
                },
              ),
            ),
            // Utilisation d'Expanded pour que cette partie occupe tout l'espace restant
          )
        ],
      ),
    );
  }
}
