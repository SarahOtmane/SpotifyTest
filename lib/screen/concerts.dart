import 'package:flutter/material.dart';
import '../data/concertArtistData.dart';
import '../components/artistConcertCard.dart';
import '../components/color.dart';

class ConcertsScreen extends StatelessWidget {
  ConcertsScreen({super.key});

  final List<Concert> _displayedConcerts = concerts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true, // Ajouté pour rendre la ListView flexible dans le ScrollView
          physics: NeverScrollableScrollPhysics(), // Pour désactiver le défilement de la ListView
          itemCount: _displayedConcerts.length,
          itemBuilder: (context, index) {
            final concert = _displayedConcerts[index];
            return ArtistConcertCard(
              concertName: concert.name,  
              genres: concert.genre, 
              date: concert.date,
              lieux: concert.lieux,
              lien: concert.lien,
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
