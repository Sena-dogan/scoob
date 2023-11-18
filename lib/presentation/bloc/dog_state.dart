import 'package:scoob/data/model/dog_model.dart';

abstract class DogState {}

class DogInitial extends DogState {}

class DogLoading extends DogState {}

class DogLoaded extends DogState {
 final List<DogModel> dogs;

 DogLoaded({required this.dogs});
}

class DogError extends DogState {}
