import 'package:flutter/material.dart';
import 'package:scoob/data/model/dog_model.dart';

class DialogImage extends StatelessWidget {
  const DialogImage({
    super.key,
    required this.dog,
  });

  final DogModel dog;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Image.network(
        dog.image ?? '',
        fit: BoxFit.cover,
        height: 343,
        width: 343,
        errorBuilder: (context, msg, object) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline_outlined),
                Text(
                  "This Dog's Image is Missing.",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
