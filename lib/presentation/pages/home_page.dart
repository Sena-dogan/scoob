import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoob/data/model/dog_model.dart';
import 'package:scoob/presentation/bloc/dog_bloc.dart';
import 'package:scoob/presentation/bloc/dog_event.dart';
import 'package:scoob/presentation/bloc/dog_state.dart';
import 'package:scoob/presentation/pages/splash_screen.dart';
import 'package:scoob/presentation/widgets/bottom_nav_bar.dart';
import 'package:scoob/presentation/widgets/home_dog_container.dart';
import 'package:scoob/presentation/widgets/search_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<DogModel> dogs;
    final dogBloc = BlocProvider.of<DogBloc>(context);
    if (dogBloc.state is DogInitial) {
      dogBloc.add(FetchDogs());
    }

    return BlocBuilder<DogBloc, DogState>(builder: (context, state) {
      debugPrint("Size: ${MediaQuery.sizeOf(context).width} x ${MediaQuery.sizeOf(context).height}");
      if (state is DogLoading) {
        return const SplashScreen();
      }
      if (state is DogLoaded) {
        dogs = state.dogs;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              'Scoob',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          body: Stack(
            children: [
              GridView.count(
                primary: false,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                children: dogs.map((dog) {
                  if (dog.image == null) {
                    return Container();
                  }
                  return HomeDogContainer(
                    dog: dog,
                  );
                }).toList(),
              ),
              const SearchBarWidget(),
            ],
          ),
          bottomNavigationBar: const BottomNavBar(
            selectedIndex: 0,
          ),
        );
      }
      return const Scaffold(
        body: Center(
          child: Text('Something went wrong!'),
        ),
      );
    });
  }
}
