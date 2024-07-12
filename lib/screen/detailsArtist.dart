import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/components/concertCard.dart';
import 'package:spotify/data/concertData.dart';
import '../components/color.dart';
import '../data/artistData.dart';

class DetailsArtistScreen extends StatefulWidget {
  final Artist artist;

  const DetailsArtistScreen({Key? key, required this.artist}) : super(key: key);

  @override
  _DetailsArtistScreenState createState() => _DetailsArtistScreenState();
}

class _DetailsArtistScreenState extends State<DetailsArtistScreen> {
  final List<Concert> _displayedConcerts = concerts;
  List<String> likedArtistIds = [];

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
    } catch (e) {
      print('Error loading liked artists: $e');
    }
  }

  Future<void> _toggleLike(String artistId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        if (likedArtistIds.contains(artistId)) {
          likedArtistIds.remove(artistId);
        } else {
          likedArtistIds.add(artistId);
        }
        prefs.setStringList('liked_artists',
            likedArtistIds.map((id) => id.toString()).toList());
        print('Updated liked artists: $likedArtistIds');
      });
    } catch (e) {
      print('Error toggling like: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
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
                  top: 50,
                  left: 25,
                  right: 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 8.0),
                          child: GestureDetector(
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                Text(
                                  widget.artist.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          size: 40,
                          color: likedArtistIds.contains(widget.artist.id)
                              ? AppColors.primary
                              : Colors.white,
                        ),
                        onPressed: () => _toggleLike(widget.artist.id),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 25,
                  child: Row(
                    children: widget.artist.genres
                        .map((genre) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4.0, horizontal: 8.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.circle,
                                        color: Colors.white, size: 8),
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
                            ))
                        .toList(),
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
          Expanded(
            child: ListView.builder(
              itemCount: _displayedConcerts.length,
              itemBuilder: (context, index) {
                final concert = _displayedConcerts[index];
                return concertCard(
                  artistName: concert.nameArtist,
                  genres: concert.genres,
                  date: concert.date,
                  location: concert.location,
                  link: concert.link,
                  city: concert.city,
                  onTap: () {
                    // Gérer la sélection du concert
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
