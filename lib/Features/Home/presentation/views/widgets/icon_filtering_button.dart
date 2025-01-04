import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class IconFilteringButton extends StatefulWidget {
  final Function()? onTap;
  const IconFilteringButton({
    super.key,
    this.onTap,
  });

  @override
  State<IconFilteringButton> createState() => _IconFilteringButtonState();
}

class _IconFilteringButtonState extends State<IconFilteringButton> {
  Color currentColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // _ ==> unused variable
      onTapDown: (_) {
        setState(() {
          currentColor = Colors.red.withOpacity(.1);
        });
      },
      onTapUp: (_) {
        setState(() {
          currentColor = const Color(0xFFffffff);
        });
      },
      onTap: () {
        final player = AudioPlayer();
        player.play(AssetSource('sounds/timkahn__tangel.wav'));
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: currentColor, borderRadius: BorderRadius.circular(12)),
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                height: 2,
                indent: 15,
                endIndent: 15,
                color: Color(0xFF6a6a6a),
                thickness: 2.2,
              ),
              Divider(
                height: 9,
                indent: 20,
                endIndent: 20,
                color: Color(0xFF6a6a6a),
                thickness: 2.2,
              ),
              Divider(
                height: 2,
                indent: 23,
                endIndent: 23,
                color: Color(0xFF6a6a6a),
                thickness: 2.2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
