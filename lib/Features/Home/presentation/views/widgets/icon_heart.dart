import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:soo2_3edda/Features/Home/presentation/manager/Heart%20Provider/heart_provider.dart';

class IconHeart extends StatefulWidget {
  final int id;
  const IconHeart({
    super.key,
    required this.id,
  });

  @override
  State<IconHeart> createState() => _IconHeartState();
}

class _IconHeartState extends State<IconHeart> {
  @override
  Widget build(BuildContext context) {
    bool isSelected =
        Provider.of<HeartProvider>(context).getSelectedItem(widget.id);
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: IconButton(
          onPressed: () {
            setState(() {
              Provider.of<HeartProvider>(context, listen: false)
                  .toggle(id: widget.id);
            });
          },
          icon: isSelected
              ? const Icon(
                  Icons.favorite,
                  size: 25,
                  color: Color.fromARGB(255, 244, 86, 54),
                )
              : const Icon(
                  FontAwesomeIcons.heart,
                  size: 23,
                ),
          color: const Color(0xFFa7a19b),
        ),
      ),
    );
  }
}
