import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoob/data/model/dog_model.dart';
import 'package:scoob/data/repository/dog_repository.dart';
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
                  ClipRRect(
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
                  ),
                  Positioned(
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
                  ),
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
              SizedBox(
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
              ),
            ],
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: 312,
            height: 56,
            child: ElevatedButton(
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
            ),
          ),
        ],
      ),
    );
  }
}
