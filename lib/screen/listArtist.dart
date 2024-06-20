import 'package:flutter/material.dart';
import '../components/artistCard.dart';
import '../data/artistData.dart';

class ListArtistScreen extends StatefulWidget {
  @override
  _ListArtistScreenState createState() => _ListArtistScreenState();
}

class _ListArtistScreenState extends State<ListArtistScreen> {
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
      appBar: AppBar(
        title: Text('Artists'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search artists...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: _filterArtists,
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
