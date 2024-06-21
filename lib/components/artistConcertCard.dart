import 'package:flutter/material.dart';
import '../components/color.dart';

class artistConcertCard extends StatelessWidget {
  final String concertName;
  final List<String> genres;
  final VoidCallback onTap;

  artistConcertCard({
    required this.concertName,
    required this.genres,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16), // Ajout de la marge ici
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
        ]
      ),
    );
  }
}
