import 'package:flutter/material.dart';
import 'package:soo2_3edda/Features/Login%20and%20Registeration/presentation/view/widgets/custom_body_login_page.dart';
import 'package:soo2_3edda/core/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundWhiteColor,
        appBar: AppBar(
          backgroundColor: backGroundWhiteColor,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.close,
                size: 28,
              )),
        ),
        body: const CustomBodyLoginPage());
  }
}
