import 'package:flutter/material.dart';
import '../components/color.dart';

class ArtistConcertCard extends StatelessWidget {
  final String date;
  final String concertName;
  final String lieux;
  final String lien;
  final List<String> genres;
  final VoidCallback onTap;

  ArtistConcertCard({
    required this.concertName,
    required this.genres,
    required this.date,
    required this.lieux,
    required this.lien,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                concertName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            lieux,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: genres.map((genre) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Chip(
                label: Text(genre),
                backgroundColor: AppColors.primarylight,
                labelStyle: TextStyle(color: Colors.white),
              ),
            )).toList(),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
                    Text(
                      'Acheter mes billets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.open_in_new,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
