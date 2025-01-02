import 'package:flutter/material.dart';

class IconMenuButton extends StatefulWidget {
  final Function()? onTap;
  const IconMenuButton({
    super.key,
    this.onTap,
  });

  @override
  State<IconMenuButton> createState() => _IconMenuButtonState();
}

class _IconMenuButtonState extends State<IconMenuButton> {
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
          currentColor = Color(0xFFffffff);
        });
      },
      onTap: widget.onTap,
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
                indent: 15,
                endIndent: 21,
                color: Color(0xFF6a6a6a),
                thickness: 2.2,
              ),
              Divider(
                height: 2,
                indent: 15,
                endIndent: 27,
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
