import 'package:flutter/material.dart';

class Genre extends StatelessWidget {
  final String genre;
  const Genre({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Row(
            children: [
              const Icon(Icons.circle, color: Colors.white, size: 8),
              const SizedBox(width: 8),
              Text(genre,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ],
    );
  }
}