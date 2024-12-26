import 'package:flutter/material.dart';

class GredientText extends StatelessWidget {
  final String text;
  const GredientText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn, // مع النص gredient يحدد كيفية دمج ال
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            Color.fromARGB(255, 140, 24, 18),
            Color.fromARGB(255, 186, 26, 17),
            Colors.red,
            Color.fromARGB(255, 184, 70, 61),
            Color.fromARGB(255, 107, 161, 206),
          ],
        ).createShader(bounds);
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 50,
          fontFamily: 'Hereabouts',
        ),
      ),
    );
  }
}
