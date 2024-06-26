import 'package:flutter/material.dart';
import '../data/concertArtistData.dart';
import '../components/artistConcertCard.dart';
import '../components/color.dart';

class ConcertsScreen extends StatelessWidget {
  ConcertsScreen({super.key});

  final List<Concert> _displayedConcerts = concerts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children : [
          
        ]
      ),
    );
  }
}
