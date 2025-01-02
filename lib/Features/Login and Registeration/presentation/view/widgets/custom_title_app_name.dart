import 'package:flutter/material.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/gredient_text.dart';


class CustomeTitleAppName extends StatelessWidget {
  const CustomeTitleAppName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GredientText(
          text: 'Soo2',
        ),
        GredientText(
          text: 'Edda',
        ),
      ],
    );
  }
}
