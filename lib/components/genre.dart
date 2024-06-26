import 'package:flutter/material.dart';
import '../data/genreData.dart';
import './color.dart';

class GenreWidget extends StatelessWidget {
  final Genre genre;
  final VoidCallback onTap;

  GenreWidget({required this.genre, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text(genre.name)),
      ),
    );
  }
}
