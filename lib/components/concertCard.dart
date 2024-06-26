import 'package:flutter/material.dart';
import 'package:spotify/components/Genre.dart';
import '../components/color.dart';

class concertCard extends StatelessWidget {
  final String date;
  final String artistName;
  final String location;
  final String link;
  final String city;
  final List<String> genres;
  final VoidCallback onTap;
  final bool showGenres;

  const concertCard({
    super.key,
    required this.artistName,
    required this.genres,
    required this.date,
    required this.location,
    required this.link,
    required this.city,
    required this.onTap,
    this.showGenres = true,
  });

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(
              top: 10.0, left: 20.0, right: 20.0, bottom: 2.0),
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 700),
                      child: Text(
                        artistName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                location + " - " + city,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (showGenres)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: genres
                            .map((genre) => Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Genre(
                                    genre: genre,
                                  ),
                                ))
                            .toList(),
                      ),
                    )
                  else
                    const Spacer(),
                  const Row(
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
                ],
              ),
            ],
          ),
        ));
  }
}
