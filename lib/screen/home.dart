import 'package:flutter/material.dart';
import '../components/artistCard.dart';
import '../data/artistData.dart';
import '../data/genreData.dart';
import '../components/searchBar.dart';
import '../components/color.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 20.0, right: 0.0, bottom: 0.0),
            child: Container(
              height: 50,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: genres
                      .map((genre) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Chip(
                              label: Text(genre.name),
                              backgroundColor: AppColors.black,
                              labelStyle: TextStyle(color: AppColors.white),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
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
