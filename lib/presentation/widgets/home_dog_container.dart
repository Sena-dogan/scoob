import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoob/data/model/dog_model.dart';
import 'package:scoob/presentation/widgets/breed_text_widget.dart';
import 'package:scoob/presentation/widgets/dog_dialog.dart';

class HomeDogContainer extends StatelessWidget {
  final DogModel dog;

  const HomeDogContainer({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return DogDialog(dog: dog,);
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
              child: CachedNetworkImage(
                  imageUrl: dog.image ?? '',
                  fit: BoxFit.cover,
                  height: 163.5,
                  width: 163.5,
                  errorWidget: (context, msg, object) => const Center(
                        child: Icon(Icons.error_outline_outlined),
                      )),
            ),
            BreedTextWidget(breed: dog.breed),
          ],
        ),
      ),
    );
  }
}
