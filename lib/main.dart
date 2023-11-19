import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoob/data/repository/dog_repository.dart';
import 'package:scoob/presentation/bloc/dog_bloc.dart';
import 'package:scoob/presentation/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogBloc(dogRepository: DogRepository()),
      child: MaterialApp(
        title: 'Scoob App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 121, 87, 182)),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
