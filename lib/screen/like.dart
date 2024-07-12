import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/components/artistImageCard.dart';
import 'package:spotify/components/concertCard.dart';
import 'package:spotify/data/artistData.dart';
import 'package:spotify/data/concertData.dart';
import 'package:spotify/services/artist.dart';
import 'package:spotify/services/concert.dart';
import '../components/color.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({Key? key}) : super(key: key);

  @override
  _LikeScreenState createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  List<String> likedArtistIds = [];
  List<Artist> _likedArtists = [];
  List<Concert> _likedConcerts = [];

  @override
  void initState() {
    super.initState();
    _loadLikedArtists();
  }

  Future<void> _loadLikedArtists() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        likedArtistIds = prefs.getStringList('liked_artists')?.toList() ?? [];
        print('Loaded liked artists: $likedArtistIds');
      });
      await _fetchArtistsDetail();
    } catch (e) {
      print('Error loading liked artists: $e');
    }
  }

  Future<void> _fetchArtistsDetail() async {
    for (String likeId in likedArtistIds) {
      try {
        final responseArtist = await fetchArtistDetail(params: likeId);
        final artist = Artist.fromJson(responseArtist);

        final responseConcerts = await fetchConcert(params: likeId);
        final concerts = (responseConcerts as List)
            .map((concertJson) => Concert.fromJson(concertJson, artist))
            .toList();

        setState(() {
          _likedArtists.add(artist);
          _likedConcerts.addAll(concerts);
        });
      } catch (e) {
        print('Failed to fetch artist: $e');
      }
    }
  }

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
              children: _likedArtists.map((artist) {
                return artistImageCard(
                  artistName: artist.name,
                  imagePath: artist.imageName,
                  onTap: () {
                    // Gérer la sélection de l'artiste
                  },
                );
              }).toList(),
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
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _likedConcerts.length,
                itemBuilder: (context, index) {
                  final concert = _likedConcerts[index];
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
          ),
        ],
      ),
    );
  }
}
