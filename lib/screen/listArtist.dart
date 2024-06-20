import 'package:flutter/material.dart';
import '../components/searchBar.dart';
import '../components/artistCard.dart';

class ListArtistScreen extends StatefulWidget {
  const ListArtistScreen({super.key});

  @override
  _ListArtistScreenState createState() => _ListArtistScreenState();
}

class _ListArtistScreenState extends State<ListArtistScreen> {

  // Un contrôleur pour le champ de recherche
  TextEditingController _searchController = TextEditingController();

  List<String> artists = [
    "Taylor Swift",
    "Ed Sheeran",
    "Adele",
    "Beyonce",
    "Drake",
    "Kanye West",
    "Billie Eilish",
  ];

  // Liste des artistes filtrés
  List<String> filteredArtists = [];

  @override
  void initState() {
    super.initState();
    filteredArtists = artists;
  }

  void _filterArtists(String query) {
    setState(() {
      filteredArtists = artists
          .where((artist) =>
              artist.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: Column(
        children: [
          SearchInput(
            controller: _searchController,
            onChanged: (query) {
              _filterArtists(query);
            },
          ),
          // Ajoutez la liste des artistes ici
          Expanded(
            child: ListView.builder(
              itemCount: filteredArtists.length,
              itemBuilder: (context, index) {
                return ArtistCard(
                  artistName: filteredArtists[index],
                  onTap: () {
                    // Gérer la sélection de l'artiste
                    print('Selected artist: ${filteredArtists[index]}');
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
