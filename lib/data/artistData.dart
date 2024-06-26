class Artist {
  final String imageName;
  final String name;
  final List<String> genres;
  final String id;
  final String link;

  Artist(
      {required this.imageName,
      required this.name,
      required this.genres,
      required this.id,
      required this.link});
  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
        name: json['name'] as String,
        imageName: json['images'][0]["url"] as String,
        genres: [
          json["classifications"][0]["genre"]["name"],
          json["classifications"][0]["subGenre"]["name"]
        ],
        id: json["id"],
        link: json["url"]);
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
