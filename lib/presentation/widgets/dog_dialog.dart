import 'package:flutter/material.dart';

class DogDialog extends StatelessWidget {
  const DogDialog({
    super.key,
    required this.breed,
  });

  final String breed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              'assets/images/huskyy.jpg',
              fit: BoxFit.cover,
              height: 343,
              width: 343,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Breed',
            style: TextStyle(
              color: Color(0xFF0055D3),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Divider(
            color: Color(0xFFE5E5EA),
            thickness: 2,
            height: 2,
            indent: 30,
            endIndent: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              breed,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        SizedBox(
          width: 312,
          height: 56,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0085FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Generate',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
