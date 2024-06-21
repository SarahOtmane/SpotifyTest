
class Genre {
  final String name;
  final String id;

  Genre({
    required this.name,
    required this.id,
  });
}

List<Genre> genres = [
  Genre(
    name: 'pop',
    id: '1',
  ),
  Genre(
    name: 'rock',
    id: '2',
  ),
  Genre(
    name: 'jazz',
    id: '3',
  ),
  Genre(
    name: 'pop',
    id: '4',
  ),
  Genre(
    name: 'techno',
    id: '5',
  ),
];
