import 'package:flutter/material.dart';
import 'package:soo2_3edda/Features/Home/presentation/views/widgets/custom_body_product_details_page.dart';
import 'package:soo2_3edda/core/constants.dart';

Widget productImage(Animation<double>? animation) {
  return AnimatedBuilder(
    builder: (context, child) {
      return AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: animation.value,
        child: child,
      );
    },
    animation: animation!,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        const TitleText(
          text: "AIP",
          fontSize: 160,
          color: lightGrey,
        ),
        Image.asset('assets/asset/show_1.png')
      ],
    ),
  );
}
