import 'package:flutter/material.dart';
import '../components/color.dart';

class ArtistConcertCard extends StatelessWidget {
  final String date;
  final String concertName;
  final String lieux;
  final String lien;
  final List<String> genres;
  final VoidCallback onTap;
  final bool showGenres;

  ArtistConcertCard({
    required this.concertName,
    required this.genres,
    required this.date,
    required this.lieux,
    required this.lien,
    required this.onTap,
    this.showGenres = true,
  });

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 2.0),
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
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            lieux,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (showGenres)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: genres.map((genre) => Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Chip(
                        avatar: Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 10,
                        ),
                        label: Text(capitalize(genre)),
                        backgroundColor: AppColors.primary,
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    )).toList(),
                  ),
                )
              else
                Spacer(),
              GestureDetector(
                onTap: onTap,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Acheter mes billets',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 6),
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
