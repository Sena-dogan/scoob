import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoob/presentation/bloc/dog_bloc.dart';
import 'package:scoob/presentation/bloc/dog_event.dart';
import 'package:scoob/presentation/bloc/dog_state.dart';
import 'package:scoob/presentation/widgets/home_dog_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogBloc>(context);
    dogBloc.add(FetchDogs());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Scoob',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: BlocBuilder<DogBloc, DogState>(
        builder: (context, state) {
          if (state is DogLoading) {
            return const CircularProgressIndicator();
          } else if (state is DogLoaded) {
            return GridView.count(
              primary: false,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              children: state.dogs.map((dog) => HomeDogContainer(breed: dog.breed)).toList(),
            );
          } else if (state is DogError) {
            return const Text('Something went wrong!');
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
