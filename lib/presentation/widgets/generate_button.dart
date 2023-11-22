import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoob/data/model/dog_model.dart';
import 'package:scoob/data/repository/dog_repository.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({
    super.key,
    required this.dog,
  });

  final DogModel dog;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await DogRepository()
            .fetchDogImage(dog.breed)
            .then((image) => image.message != null
                ? showCupertinoModalPopup(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  image.message ?? '',
                                  fit: BoxFit.cover,
                                  height: 256,
                                  width: 256,
                                  errorBuilder:
                                      (context, msg, object) =>
                                          const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons
                                              .error_outline_outlined),
                                          Text(
                                            "This Dog's Image is Missing.",
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(2),
                                ),
                                child: const Icon(
                                  Icons.close_rounded,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ))
                : null);
      },
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
    );
  }
}
