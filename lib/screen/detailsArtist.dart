import 'package:flutter/material.dart';
import '../components/color.dart';
import '../data/concertArtistData.dart';
import '../data/artistData.dart';
import '../components/artistConcertCard.dart';

class DetailsArtistScreen extends StatefulWidget {
  final Artist artist;

  const DetailsArtistScreen({Key? key, required this.artist}) : super(key: key);

  @override
  _DetailsArtistScreenState createState() => _DetailsArtistScreenState();
}

class _DetailsArtistScreenState extends State<DetailsArtistScreen> {
  final List<Concert> _displayedConcerts = concerts; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.artist.imageName), 
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 25,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    child: Text(
                      widget.artist.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 25,
                  child: Row(
                    children: widget.artist.genres.map((genre) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.circle, color: Colors.white, size: 8),
                            const SizedBox(width: 8),
                            Text(genre,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ),
                    )).toList(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              widget.artist.description,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.start,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Concert à venir',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
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
        ],
      ),
    );
  }
}
