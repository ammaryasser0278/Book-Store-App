import 'package:flutter/material.dart';

class CustomRatingText extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;

  const CustomRatingText({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(Icons.star, color: Colors.yellow, size: 22.0),
        const SizedBox(width: 5.0),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: '4.8 ',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: ' (2536)',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                  color: Color.fromARGB(255, 212, 205, 205),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
