import 'package:flutter/material.dart';
import '../components/artistConcertCard.dart';
import '../data/concertArtistData.dart';

class ConcertsScreen extends StatelessWidget {
  ConcertsScreen({super.key});

  final List<Concert> _displayedConcerts = concerts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true, // Ajouté pour rendre la ListView flexible dans le ScrollView
          physics: NeverScrollableScrollPhysics(), // Pour désactiver le défilement de la ListView
          itemCount: _displayedConcerts.length,
          itemBuilder: (context, index) {
            final concert = _displayedConcerts[index];
            return artistConcertCard(
              concertName: concert.name,  // Ajout de l'URL de l'image
              genres: concert.genre, // Correctement référencé depuis concert
              onTap: () {
                // Gérer la sélection de l'artiste
              },
            );
          },
        ),
      ),
    );
  }
}
