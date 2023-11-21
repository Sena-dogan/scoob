import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:scoob/data/model/dog_image_model.dart';
import 'dart:convert';
import 'package:scoob/data/model/dog_model.dart';
import 'package:scoob/data/model/dog_sub_breed_model.dart';

class DogRepository {
  Future<List<DogModel>> fetchDogs() async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));
    if (response.statusCode == 200) {
      var allDogs = (json.decode(response.body) as Map<String, dynamic>);
      var dogsList = await Future.wait(
        allDogs['message'].keys.map<Future<DogModel>>((breed) async {
          DogSubBreed? dogSubBreed = await fetchDogSubBreeds(breed);
          DogImage? dogImage = await fetchDogImage(breed);

          return DogModel(
            breed: breed,
            subBreed: dogSubBreed,
            image: dogImage.message,
          );
        }),
      );
      // Remove dogs with null image
      dogsList = dogsList.where((x) => x.image != null).toList();
      return dogsList.cast<DogModel>();
    } else {
      debugPrint("Error: ${response.statusCode}");
      throw Exception('Failed to load dogs');
    }
  }

  Future<DogImage> fetchDogImage(String breed) async {
    final response = await http
        .get(Uri.parse('https://dog.ceo/api/breed/$breed/images/random'));
    if (response.statusCode == 200) {
      var dogImage = DogImage.fromJson(json.decode(response.body));

      if (dogImage.status != 'success') {
        // Print the request URL
        debugPrint(
            "Fetch Image Request: https://dog.ceo/api/breed/$breed/images/random");
        // Skip if image is not available
        return DogImage(
          message: null,
          status: null,
        );
      } else {
        if (dogImage.message != null) {
          var dogImageResponse = await http.get(Uri.parse(dogImage.message!));
          if (dogImageResponse.statusCode == 404) {
            // Print the request URL
            debugPrint("404 Fetch Image Request: ${dogImage.message}");
            // Skip if image is not available
            return DogImage(
              message: null,
              status: null,
            );
          }
        }
        return dogImage;
      }
    } else {
      debugPrint(
          "Fetch Image Request: https://dog.ceo/api/breed/$breed/images/random");
      debugPrint("Fetch Image Error: ${response.statusCode}");
      throw Exception('Failed to load dog image');
    }
  }

  Future<DogSubBreed> fetchDogSubBreeds(String breed) async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breed/$breed/list'));
    if (response.statusCode == 200) {
      var dogSubBreed = DogSubBreed.fromJson(json.decode(response.body));
      debugPrint("$breed has ${dogSubBreed.message?.length} sub breeds");
      return dogSubBreed;
    } else {
      debugPrint(
          "Fetch Sub Breed Request: https://dog.ceo/api/breed/$breed/list");
      debugPrint("Fetch Sub Breed Error: ${response.statusCode}");
      throw Exception('Failed to load dog sub breed');
    }
  }
}
