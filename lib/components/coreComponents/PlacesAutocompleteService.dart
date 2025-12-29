import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> getPlaceDetailsFromPlaceId({
  required String apiKey,
  required String placeId,
}) async {
  final url =
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['status'] == 'OK') {
      return data['result'];
    }
  }
  return null;
}
