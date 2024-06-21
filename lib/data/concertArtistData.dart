
class Concert {
  final String date;
  final String name;
  final String lieux;
  final String lien;
  final List<String> genre;

  Concert({
    required this.date,
    required this.name,
    required this.lieux,
    required this.lien,
    required this.genre,
  });
}

List<Concert> concerts = [
  Concert(
    date: '24/08/2024',
    name: 'TaylorSwift',
    lien: 'test',
    lieux: 'La Maroquinnerie, Paris, 75007',
    genre: ['rock', 'pop'],
  ),
  Concert(
    date: '24/08/2024',
    name: 'TaylorSwift',
    lien: 'test',
    lieux: 'La Maroquinnerie, Paris, 75007',
    genre: ['rock', 'pop'],
  ),
  Concert(
    date: '24/08/2024',
    name: 'TaylorSwift',
    lien: 'test',
    lieux: 'La Maroquinnerie, Paris, 75007',
    genre: ['rock', 'pop'],
  ),
  Concert(
    date: '24/08/2024',
    name: 'TaylorSwift',
    lien: 'test',
    lieux: 'La Maroquinnerie, Paris, 75007',
    genre: ['rock', 'pop'],
  ),
];
