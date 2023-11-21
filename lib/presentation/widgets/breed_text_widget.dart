import 'package:flutter/material.dart';
import 'package:scoob/utils/extensions/string_extension.dart';

/// A widget that displays the breed text.
///
/// This widget is used to display a breed text in a stylized container.
/// It takes a [breed] parameter which is the text to be displayed.
/// The [breed] text is capitalized and displayed in a centered position.
/// The container has a fixed width and height with rounded corners.
/// The background color of the container is semi-transparent black.
/// The text color is white with a font size of 16 and a medium font weight.
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
          width: 150,
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
              breed.capitalize(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                
              ),
            ),
          ),
        ),
      ),
    );
  }
}
