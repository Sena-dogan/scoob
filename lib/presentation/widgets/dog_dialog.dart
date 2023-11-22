import 'package:flutter/material.dart';
import 'package:scoob/data/model/dog_model.dart';
import 'package:scoob/presentation/widgets/dialog_image.dart';
import 'package:scoob/presentation/widgets/generate_button.dart';
import 'package:scoob/presentation/widgets/sub_breed.dart';
import 'package:scoob/utils/extensions/string_extension.dart';

class DogDialog extends StatelessWidget {
  const DogDialog({
    super.key,
    required this.dog,
  });

  final DogModel dog;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width * 0.9,
      child: AlertDialog(
        contentPadding: const EdgeInsets.all(0),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  DialogImage(dog: dog),
                  const CloseDialog(),
                ],
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
                  dog.breed.capitalize(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Text(
                'Sub Breed',
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
              DialogSubBreed(dog: dog),
            ],
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: 312,
            height: 56,
            child: GenerateButton(dog: dog),
          ),
        ],
      ),
    );
  }
}

class CloseDialog extends StatelessWidget {
  const CloseDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      right: 16,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.close_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
