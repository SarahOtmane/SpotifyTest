import 'package:flutter/material.dart';
import '../components/artistConcertCard.dart';
import '../components/color.dart';

import '../components/searchBar.dart';
import '../data/concertArtistData.dart';

class ConcertsScreen extends StatefulWidget {
  @override
  _ConcertScreenState createState() => _ConcertScreenState();
}

class _ConcertScreenState extends State<ConcertsScreen>{
  TextEditingController _searchController = TextEditingController();
  List<Concert> _displayedConcerts = concerts;


  void _filterConcerts(String query) {
    final filteredConcerts = concerts.where((concert) {
      final concertLower = concert.lieux.toLowerCase();
      final queryLower = query.toLowerCase();

      return concertLower.contains(queryLower);
    }).toList();
    setState(() {
      _displayedConcerts = filteredConcerts;
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
            onChanged: _filterConcerts,
            placeholder: 'Chercher une ville',
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