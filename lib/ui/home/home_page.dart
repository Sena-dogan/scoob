import 'package:flutter/material.dart';

List<Widget> dogs = [
  const HomeDogContainer(),
  const HomeDogContainer(),
  const HomeDogContainer(),
  const HomeDogContainer(),
  const HomeDogContainer(),
  const HomeDogContainer(),
  const HomeDogContainer(),
  const HomeDogContainer(),
  const HomeDogContainer(),
  const HomeDogContainer(),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: 2,
          children: dogs,
        ));
  }
}

class HomeDogContainer extends StatelessWidget {
  const HomeDogContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 163.5,
      width: 163.5,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text('Scooby Doo'),
    );
  }
}
