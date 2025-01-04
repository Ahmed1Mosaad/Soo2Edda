import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeart extends StatefulWidget {
  const IconHeart({super.key});

  @override
  State<IconHeart> createState() => _IconHeartState();
}

class _IconHeartState extends State<IconHeart> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: IconButton(
          onPressed: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          icon: isSelected
              ? const Icon(
                  FontAwesomeIcons.heart,
                  size: 23,
                )
              : const Icon(
                  Icons.favorite,
                  size: 25,
                  color: Color.fromARGB(255, 244, 86, 54),
                ),
          color: const Color(0xFFa7a19b),
        ),
      ),
    );
  }
}
