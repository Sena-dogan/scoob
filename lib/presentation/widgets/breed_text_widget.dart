import 'package:flutter/material.dart';

class BreedTextWidget extends StatelessWidget {
  const BreedTextWidget({
    super.key,
    required this.breed,
  });

  final String breed;

  @override
  Widget build(BuildContext context) {
    return Align(
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
    );
  }
}