class DogModel {
  final String breed;

  DogModel({required this.breed});

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      breed: json['message'].keys.toString(),
    );
  }
}
