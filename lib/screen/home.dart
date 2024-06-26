import 'package:flutter/material.dart';
import 'package:spotify/services/artist.dart';
import '../components/artistCard.dart';
import '../data/artistData.dart';
import '../data/genreData.dart';
import '../components/searchBar.dart';
import '../components/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  List<Artist> _defaultArtistes = [];
  List<Artist> _displayedArtists = [];

  @override
  void initState() {
    super.initState();
    _fetchArtists();
  }

  Future<void> _fetchArtists() async {
    try {
      final response = await fetchArtist();
      setState(() {
        _defaultArtistes =
            response.map<Artist>((json) => Artist.fromJson(json)).toList();
        _displayedArtists = _defaultArtistes;
      });
    } catch (e) {
      setState(() {});
      print('Failed to fetch artists: $e');
    }
  }

  void _filterArtists(String query) {
    final filteredArtists = _defaultArtistes.where((artist) {
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
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: genres
                    .map((genre) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Chip(
                            label: Text(genre.name),
                            backgroundColor: AppColors.black,
                            labelStyle: const TextStyle(color: AppColors.white),
                          ),
                        ))
                    .toList(),
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
                  genres: artist.genres,
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
