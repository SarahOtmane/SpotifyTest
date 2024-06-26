import 'package:flutter/material.dart'; // Assurez-vous d'importer Concert ici
import 'package:spotify/components/concertCard.dart';
import 'package:spotify/components/searchBar.dart';
import 'package:spotify/data/artistData.dart';
import 'package:spotify/data/concertData.dart';
import 'package:spotify/services/artist.dart'; // Assurez-vous d'importer Artist ici
import 'package:spotify/services/event.dart'; // Assurez-vous d'importer fetchEventLocation ici
import 'package:url_launcher/url_launcher.dart'; // Importez le package url_launcher

class ConcertsScreen extends StatefulWidget {
  @override
  _ConcertsScreenState createState() => _ConcertsScreenState();
}

class _ConcertsScreenState extends State<ConcertsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Concert> _defaultConcerts = [];
  List<Concert> _displayedConcerts = [];

  @override
  void initState() {
    super.initState();
    _fetchConcert();
  }

  Future<void> _fetchConcert() async {
    try {
      final response = await fetchEventLocation();
      List<Concert> concerts = [];

      // Parcourir chaque élément de la liste response
      for (var event in response) {
        Artist? artist;

        // Vérifier si les attractions sont disponibles
        if (event["_embedded"]["attractions"] != null) {
          final defaultArtist = await fetchArtistDetail(
            params: event["_embedded"]["attractions"][0]["id"],
          );
          artist = Artist.fromJson(defaultArtist);
        }

        // Ajouter un concert à la liste concerts en utilisant Concert.fromJson
        concerts.add(Concert.fromJson(event, artist));
      }

      setState(() {
        _defaultConcerts = concerts;
        _displayedConcerts = _defaultConcerts;
      });
    } catch (e) {
      setState(() {});
      print('Failed to fetch concerts: $e');
    }
  }

  void _filterConcerts(String query) {
    if (query.isNotEmpty) {
      final filteredConcerts = _defaultConcerts.where((concert) {
        final concertLower = concert.city.toLowerCase();
        final queryLower = query.toLowerCase();

        return concertLower.contains(queryLower);
      }).toList();
      setState(() {
        _displayedConcerts = filteredConcerts;
      });
    }
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Votre barre de recherche
          SearchInput(
            controller: _searchController,
            onChanged: _filterConcerts,
            placeholder: 'Chercher une ville',
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _displayedConcerts.length,
              itemBuilder: (context, index) {
                final concert = _displayedConcerts[index];
                return ArtistConcertCard(
                  link: concert.link,
                  location: concert.location,
                  artistName: concert.nameArtist,
                  date: concert.date,
                  genres: concert.genres,
                  city: concert.city,
                  onTap: () {
                    _launchUrl(Uri.parse(concert.link));
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
