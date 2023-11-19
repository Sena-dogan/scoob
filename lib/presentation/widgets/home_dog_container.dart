import 'package:flutter/material.dart';

class HomeDogContainer extends StatelessWidget {
  final String breed;

  const HomeDogContainer({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 163.5,
      width: 163.5,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/huskyy.jpg',
              fit: BoxFit.cover,
              height: 163.5,
              width: 163.5,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                width: 130,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.24),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    breed,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
