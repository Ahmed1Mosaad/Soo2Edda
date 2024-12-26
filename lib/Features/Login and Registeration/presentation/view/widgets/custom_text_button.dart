import 'package:flutter/material.dart';
import 'package:soo2_3edda/core/constants.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomTextButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: const Color(0xFFbc1f26),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            fixedSize: Size(500, 60)),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: white, fontSize: 20),
        ));
  }
}
