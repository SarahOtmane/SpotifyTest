import 'fetch_api.dart';

// fetch all artists
Future<dynamic> fetchArtist() async {
  ApiService apiService = ApiService();
  try {
    final response = await apiService
        .get('/attractions', params: {"classificationName": "Music"});
    return response["_embedded"]["attractions"];
  } catch (e) {
    throw Exception('Failed to fetch data: $e');
  }
}

// fetch single artist by id
Future<dynamic> fetchArtistDetail({String? params}) async {
  ApiService apiService = ApiService();
  if (params != null) {
    try {
      final response =
          await apiService.get('/attractions', params: {'id': params});
      return response["_embedded"]["attractions"][0];
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  } else {
    throw Exception('Entrez un nom');
  }
}
