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
        allDogs['message'].keys.map<Future<DogModel>>((x) async {
          var dogImage = await fetchDogImage(x);
          if (dogImage.status != 'success') {
            // Print the request URL
            debugPrint(
                "Fetch Image Request: https://dog.ceo/api/breed/$x/images/random");
            // Skip if image is not available
            return DogModel(
              breed: x,
              image: null,
            );
          }

          // Check if dog image message url is exist
          // Because even if the status is success, and the message is not null
          // The message url of the image can be lead to 404
          // So we need to check if the message url is exist
          // if exist, we check if the status is 404 or not
          // if not, we return the dog model
          // if exist, we return null
          if (dogImage.message != null) {
            var dogImageResponse = await http.get(Uri.parse(dogImage.message!));
            if (dogImageResponse.statusCode == 404) {
              // Print the request URL
              debugPrint("Fetch Image Request: ${dogImage.message}");
              // Skip if image is not available
              return DogModel(
                breed: x,
                image: null,
              );
            }
          }

          return DogModel(
            breed: x,
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
      return DogImage.fromJson(json.decode(response.body));
    } else {
      debugPrint(
          "Fetch Image Request: https://dog.ceo/api/breed/$breed/images/random");
      debugPrint("Fetch Image Error: ${response.statusCode}");
      throw Exception('Failed to load dog image');
    }
  }

  Future<List<String>> fetchDogSubBreeds(String breed) async {
    final response =
        await http.get(Uri.parse('https://dog.ceo/api/breed/$breed/list'));
    if (response.statusCode == 200) {
      var dogSubBreed = DogSubBreed.fromJson(json.decode(response.body));
      return dogSubBreed.message!;
    } else {
      debugPrint(
          "Fetch Sub Breed Request: https://dog.ceo/api/breed/$breed/list");
      debugPrint("Fetch Sub Breed Error: ${response.statusCode}");
      throw Exception('Failed to load dog sub breed');
    }
  }
}
