
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
    date: '01/08/2024',
    name: 'ED Sheeran',
    lien: 'test',
    lieux: 'La Maroquinnerie, Goussainville, 95190',
    genre: ['rock', 'pop'],
  ),
  Concert(
    date: '30/08/2024',
    name: 'The Weekend',
    lien: 'test',
    lieux: 'La Maroquinnerie, Boulogne Billancourt, 92100',
    genre: ['rock', 'pop'],
  ),
];
