import 'package:flutter/material.dart';
import '../components/artistConcertCard.dart';
import '../components/color.dart';
import '../components/searchBar.dart';
import '../data/concertArtistData.dart';

class ConcertsScreen extends StatefulWidget {
  @override
  _ConcertScreenState createState() => _ConcertScreenState();
}

class _ConcertScreenState extends State<ConcertsScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Concert> _displayedConcerts = [];
  bool _isDefaultCity = true;

  @override
  void initState() {
    super.initState();
    _displayConcertsForDefaultCity();
  }

  void _displayConcertsForDefaultCity() {
    final filteredConcerts = concerts.where((concert) {
      return concert.lieux.toLowerCase().contains('paris');
    }).toList();
    setState(() {
      _displayedConcerts = filteredConcerts;
      _isDefaultCity = true;
    });
  }

  void _filterConcerts(String query) {
    if (query.isNotEmpty) {
      final filteredConcerts = concerts.where((concert) {
        final concertLower = concert.lieux.toLowerCase();
        final queryLower = query.toLowerCase();

        return concertLower.contains(queryLower);
      }).toList();
      setState(() {
        _displayedConcerts = filteredConcerts;
        _isDefaultCity = false;  
      });
    } else {
      _displayConcertsForDefaultCity();  
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          SearchInput(
            controller: _searchController,
            onChanged: _filterConcerts,
            placeholder: 'Chercher une ville',
          ),
          if (_isDefaultCity) 
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ville par défaut : Paris',
                  style: TextStyle(color: Colors.white),
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
                    // Handle artist selection
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
