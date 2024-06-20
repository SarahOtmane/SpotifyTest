import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
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
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 5),
                Row(
                  children: genres.map((genre) => Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Chip(
                      label: Text(genre),
                      backgroundColor: Colors.purple,
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                  )).toList(),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward, color: Colors.white),
        ],
      ),
    );
  }
}
