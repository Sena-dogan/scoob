import 'package:flutter/material.dart';
import 'package:scoob/presentation/widgets/breed_text_widget.dart';
import 'package:scoob/presentation/widgets/dog_dialog.dart';

class HomeDogContainer extends StatelessWidget {
  final String breed;

  const HomeDogContainer({super.key, required this.breed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return DogDialog(breed: breed);
          },
        );
      },
      child: SizedBox(
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
            BreedTextWidget(breed: breed),
          ],
        ),
      ),
    );
  }
}
