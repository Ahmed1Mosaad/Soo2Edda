import 'package:flutter/material.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/icon_heart.dart';
import 'package:soo2_3edda/core/constants.dart';


class CardItem extends StatelessWidget {
  final String image;
  const CardItem({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:213,
      height: 305,
      child: Card(
        elevation: 2,
        color: white,
        child: Column(
          children: [
            const IconHeart(),
            Stack(
              clipBehavior: Clip.none,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 47,
                    backgroundColor: Color(0xFFfce5dd),
                  ),
                ),
                Positioned(
                  bottom: -37,
                  left: 20,
                  child: Image(
                    image: AssetImage(image),
                    width: 170,
                    height: 170,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Nike Air Max 200',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const Text(
              'Trending Now',
              style: TextStyle(
                  fontSize: 16, color: orange, fontWeight: FontWeight.w700),
            ),
            const Text(
              '240.0',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
