import 'package:flutter/material.dart';


class TextTitleName extends StatelessWidget {
  const TextTitleName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our',
            style: TextStyle(
              fontWeight: FontWeight.w300,
                fontSize: 30,
                fontFamily: 'Fontspring-DEMO-jamgrotesque-regular'),
          ),
          Text(
            'Products',
            style: TextStyle(
              fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'Fontspring-DEMO-jamgrotesque-bold'),
          ),
        ],
      ),
    );
  }
}
