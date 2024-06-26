import 'fetch_api.dart';

// fetch all event with concerns one artist
Future<dynamic> fetchEvent({String? params}) async {
  ApiService apiService = ApiService();
  if (params != null) {
    try {
      var response =
          await apiService.get("/events", params: {"attractionId": params});
      return response;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  } else {
    throw Exception('Entrez un nom');
  }
}

// fetch event based on city
Future<dynamic> fetchEventLocation({String? params}) async {
  ApiService apiService = ApiService();
  // if (params != null) {
  try {
    var response = await apiService.get("/events", params: {
      // TODO à changer
      "locale": "fr-fr",
      "classificationId": "KZFzniwnSyZfZ7v7nJ",
      "size": 10,
      "countryCode": "FR"
    });
    return response["_embedded"]["events"];
  } catch (e) {
    throw Exception('Failed to fetch data: $e');
  }
  // } else {
  //   throw Exception('Entrez une ville');
  // }
}
