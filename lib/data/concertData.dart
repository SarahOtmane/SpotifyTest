import 'package:spotify/data/artistData.dart';

class Concert {
  final String date;
  final String nameArtist;
  final String location;
  final String city;
  final String postalCode;
  final String link;
  final List<String> genres;

  Concert({
    required this.date,
    required this.nameArtist,
    required this.location,
    required this.city,
    required this.postalCode,
    required this.link,
    required this.genres,
  });
  factory Concert.fromJson(Map<String, dynamic> json, Artist? defaultArtist) {
    return Concert(
        date: json['dates']["start"]["localDate"] as String,
        nameArtist: defaultArtist != null ? defaultArtist.name : "null",
        location: json["_embedded"]["venues"][0]["name"] ?? "location",
        city: json["_embedded"]["venues"][0]["city"]?["name"] ?? "city",
        postalCode:
            json["_embedded"]["venues"][0]["postalCode"] ?? "postal code",
        link: json["url"] ?? "",
        genres: defaultArtist != null ? defaultArtist.genres : ["null"]);
  }
}

List<Concert> concerts = [
  Concert(
      date: '24/08/2024',
      nameArtist: 'TaylorSwift',
      link: 'test',
      location: 'La Maroquinnerie, Paris, 75007',
      genres: ['rock', 'pop'],
      city: 'Paris',
      postalCode: "33700"),
  Concert(
      date: '24/08/2024',
      nameArtist: 'TaylorSwift',
      link: 'test',
      location: 'La Maroquinnerie, Paris, 75007',
      genres: ['rock', 'pop'],
      city: 'Paris',
      postalCode: "33700"),
  Concert(
      date: '24/08/2024',
      nameArtist: 'TaylorSwift',
      link: 'test',
      location: 'La Maroquinnerie, Paris, 75007',
      genres: ['rock', 'pop'],
      city: 'Paris',
      postalCode: "33700"),
];
