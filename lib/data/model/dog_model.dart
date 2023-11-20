import 'package:scoob/data/model/dog_sub_breed_model.dart';

class DogModel {
  final String breed;
  final String? image;
  final DogSubBreed? subBreed;

  DogModel({required this.breed, required this.image, this.subBreed});

  factory DogModel.fromJson(Map<String, dynamic> json, String image, DogSubBreed? subBreed) {
    return DogModel(
      breed: json['message'].keys.toString(),
      image: image,
      subBreed: subBreed,
    );
  }
}
