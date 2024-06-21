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

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 2.0),
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0, bottom: 20.0),
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
                  Wrap(
                    spacing: 5.0, 
                    runSpacing: 5.0, 
                    children: genres.map((genre) => Chip(
                      avatar: Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 10,
                      ),
                      label: Text(capitalize(genre)),
                      backgroundColor: AppColors.primary,
                      labelStyle: TextStyle(color: Colors.white),
                    )).toList(),
                  )
                ],
              ),
            ),
            Icon(Icons.arrow_forward, color: AppColors.white),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
