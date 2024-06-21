import 'package:flutter/material.dart';
import '../components/artistCard.dart';
import '../data/artistData.dart';
import '../components/searchBar.dart'; 
import '../components/color.dart';

class ListArtistScreen extends StatefulWidget {
  @override
  _ListArtistScreenState createState() => _ListArtistScreenState();
}

class _ListArtistScreenState extends State<ListArtistScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Artist> _displayedArtists = artists;

  void _filterArtists(String query) {
    final filteredArtists = artists.where((artist) {
      final artistLower = artist.name.toLowerCase();
      final queryLower = query.toLowerCase();

      return artistLower.contains(queryLower);
    }).toList();

    setState(() {
      _displayedArtists = filteredArtists;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          SearchInput( 
            controller: _searchController,
            onChanged: _filterArtists,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _displayedArtists.length,
              itemBuilder: (context, index) {
                final artist = _displayedArtists[index];
                return ArtistCard(
                  artistName: artist.name,
                  imageUrl: artist.imageName,
                  genres: artist.genre,
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
