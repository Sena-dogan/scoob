import 'package:flutter/material.dart';
import 'package:scoob/data/model/dog_model.dart';
import 'package:scoob/utils/extensions/string_extension.dart';

class DialogSubBreed extends StatelessWidget {
  const DialogSubBreed({
    super.key,
    required this.dog,
  });

  final DogModel dog;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 343,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: dog.subBreed!.message!.isEmpty
            ? 1
            : dog.subBreed?.message?.length,
        itemBuilder: (context, index) {
          if (dog.subBreed?.message?.isEmpty ?? true) {
            return const Center(
              child: Text(
                'No Sub Breed',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }
          return Center(
            child: Text(
              dog.subBreed?.message?[index].capitalize() ??
                  'Sub Breed',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}