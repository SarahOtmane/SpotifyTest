import 'dart:ffi';

class Artist {
  final String imageName;
  final String name;
  final List<String> genre;

  Artist({
    required this.imageName,
    required this.name,
    required this.genre,
  });
}

List<Artist> artists = [
  Artist(
    imageName: 'url',
    name: 'TaylorSwift',
    genre: ['rock', 'pop'],
  ),
  Artist(
    imageName: 'url',
    name: 'Ed Sheeran',
    genre: ['jaz', 'pop'],
  ),
];
