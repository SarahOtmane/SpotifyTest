import 'package:flutter/material.dart';
import '../components/color.dart';

class ArtistCard extends StatelessWidget {
  final String artistName;
  final String imageUrl;
  final List<String> genres;
  final VoidCallback onTap;

  ArtistCard({
    required this.artistName,
    required this.imageUrl,
    required this.genres,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 2.0), 
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          SizedBox(width: 10),
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
            radius: 30,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  artistName,
                  style: TextStyle(color: AppColors.white, fontSize: 18),
                ),
                SizedBox(height: 5),
                Row(
                  children: genres.map((genre) => Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Chip(
                      label: Text(genre),
                      backgroundColor: AppColors.primary,
                      labelStyle: TextStyle(color: AppColors.white),
                    ),
                  )).toList(),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward, color: AppColors.white),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
