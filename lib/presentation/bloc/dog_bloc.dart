import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoob/data/repository/dog_repository.dart';
import 'package:scoob/presentation/bloc/dog_event.dart';
import 'package:scoob/presentation/bloc/dog_state.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final DogRepository dogRepository;

  DogBloc({required this.dogRepository}) : super(DogInitial()) {
    on<FetchDogs>((event, emit) async {
      emit(DogLoading());
      try {
        final dogs = await dogRepository.fetchDogs();
        emit(DogLoaded(dogs: dogs));
      } catch (e) {
        emit(DogError(message: e.toString()));
      }
    });
  }
}
