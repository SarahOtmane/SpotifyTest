import 'package:flutter/material.dart';
import 'package:spotify/components/artistImageCard.dart';
import 'package:spotify/components/concertCard.dart';
import 'package:spotify/data/concertData.dart';
import '../components/color.dart';

class LikeScreen extends StatelessWidget {
  LikeScreen({Key? key});

  final List<Concert> _displayedConcerts = concerts;
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
                  imagePath:
                      "https://i.pinimg.com/originals/5f/03/7b/5f037bf6707640ed2dd3babd4a268ac3.jpg",
                  onTap: () {
                    // Gérer la sélection de l'artiste
                  },
                ),
                ArtistImageCard(
                  artistName: "Ed Sheeran",
                  imagePath:
                      "https://i.pinimg.com/originals/5f/03/7b/5f037bf6707640ed2dd3babd4a268ac3.jpg",
                  onTap: () {
                    // Gérer la sélection de l'artiste
                  },
                ),
                ArtistImageCard(
                  artistName: "Ariana Grande",
                  imagePath:
                      "https://i.pinimg.com/originals/5f/03/7b/5f037bf6707640ed2dd3babd4a268ac3.jpg",
                  onTap: () {
                    // Gérer la sélection de l'artiste
                  },
                ),
                ArtistImageCard(
                  artistName: "Drake",
                  imagePath:
                      "https://i.pinimg.com/originals/5f/03/7b/5f037bf6707640ed2dd3babd4a268ac3.jpg",
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
                  return concertCard(
                    link: concert.link,
                    location: concert.location,
                    artistName: concert.nameArtist,
                    date: concert.date,
                    genres: concert.genres,
                    city: concert.city,
                    onTap: () {
                      // _launchUrl(Uri.parse(concert.link));
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
