class Artist {
  final String imageName;
  final String name;
  final List<String> genres;
  final String id;
  final String link;
  final String description;

  Artist({
    required this.imageName,
    required this.name,
    required this.genres,
    required this.id,
    required this.link,
    required this.description,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      name: json['name'] as String,
      imageName: json['images'][0]["url"] as String,
      genres: [
        json["classifications"][0]["genre"]["name"],
        json["classifications"][0]["subGenre"]["name"]
      ],
      id: json["id"] as String,
      link: json["url"] as String,
      description: json.containsKey("description") && json["description"] != null
          ? json["description"] as String
          : 'Aucune description pour le moment',
    );
  }
}


// List<Artist> artists = [
//   Artist(
//     imageName: '../../assets/images/taylorSwift.jpg',
//     name: 'TaylorSwift',
//     genre: ['rock', 'pop'],
//   ),
//   Artist(
//     imageName: '../../assets/images/taylorSwift.jpg',
//     name: 'Ed Sheeran',
//     genre: ['jaz', 'pop'],
//   ),
// ];
