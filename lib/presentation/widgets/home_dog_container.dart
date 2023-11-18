import 'package:flutter/material.dart';

class HomeDogContainer extends StatelessWidget {
  final String breed;

  const HomeDogContainer({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 163.5,
      width: 163.5,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          breed,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
