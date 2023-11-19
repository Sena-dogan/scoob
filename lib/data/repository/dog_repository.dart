import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scoob/data/model/dog_model.dart';

class DogRepository {
  Future<List<DogModel>> fetchDogs() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));
    if (response.statusCode == 200) {
      var allDogs = (json.decode(response.body) as Map<String, dynamic>);
      var dogsList = List<DogModel>.from(
        allDogs['message'].keys.map((x) => DogModel(breed: x)),
      );
      return dogsList;
    } else {
      throw Exception('Failed to load dogs');
    }
  }
}
